param(
    [string]$Token = $env:VERCEL_TOKEN,
    [string]$Project = '',
    [string]$Scope = ''
)

# If token not provided via parameter or env, try common local token files then prompt
if (-not $Token) {
    # 1) Try user's profile .verceltoken
    $profileToken = Join-Path $env:USERPROFILE '.verceltoken'
    if (Test-Path $profileToken) {
        $Token = (Get-Content $profileToken -ErrorAction SilentlyContinue).Trim()
    }
}

if (-not $Token) {
    # 2) Try repository root .verceltoken (ignored by .gitignore)
    $repoToken = Join-Path (Get-Location) '.verceltoken'
    if (Test-Path $repoToken) {
        $Token = (Get-Content $repoToken -ErrorAction SilentlyContinue).Trim()
    }
}

if (-not $Token) {
    # 3) Prompt securely
    Write-Host 'Vercel token not found in env or .verceltoken files. Please enter it (will not echo):'
    $secure = Read-Host -AsSecureString
    $ptr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($secure)
    $Token = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($ptr)
    [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ptr)
}

$env:VERCEL_TOKEN = $Token

Write-Host "Using Vercel token from environment or local file."

# Explicitly build a production web release first (requested behavior)
Write-Host "Building Flutter web release (HTML renderer)... (flutter build web --release --web-renderer html)"
flutter build web --release --web-renderer html

# Some previous builds may leave a 'canvaskit' folder in build/web. Even when
# building with the HTML renderer that folder can remain and some hosting
# configurations / loaders may still serve CanvasKit assets causing Safari to
# attempt to use WebGL which can repeatedly crash on iOS. Remove it to force
# a pure-HTML renderer deployment.
$canvaskitPath = Join-Path (Get-Location) 'build\web\canvaskit'
if (Test-Path $canvaskitPath) {
    try {
        Remove-Item -Recurse -Force $canvaskitPath
        Write-Host "Removed leftover canvaskit directory to avoid serving CanvasKit assets."
    } catch {
        Write-Host "Warning: Failed to remove canvaskit directory: $($_.Exception.Message)"
    }
}

# Sanity check: warn if index.html references canvaskit (unlikely for HTML renderer)
$indexHtml = Join-Path (Get-Location) 'build\web\index.html'
if (Test-Path $indexHtml) {
    $contents = Get-Content $indexHtml -Raw -ErrorAction SilentlyContinue
    if ($contents -match 'canvaskit') {
        Write-Host "Warning: index.html contains a reference to 'canvaskit' - review build output."
    }
}

# Default the project name to your 'nainaifolio' project if not provided
if ([string]::IsNullOrWhiteSpace($Project)) {
    $Project = 'nainaifolio'
    Write-Host "No -Project supplied; defaulting to '$Project' for deployment."
}


# Deploy the static build/web directory directly. Avoid --prebuilt (it expects a .vercel/output layout).
$args = @('--prod','--yes','--token',$env:VERCEL_TOKEN,'--local-config','vercel.json')

# NOTE: The `--name` flag is deprecated in newer Vercel CLI releases. To target a specific
# project non-interactively prefer linking the directory to a project first using `vercel link`
# or deploy under a specific scope (team or personal) with `--scope`.
if ($Scope -ne '') { $args += @('--scope', $Scope) }

# Link the current directory to the named Vercel project so the deploy target is explicit
Write-Host "Linking local directory to Vercel project: $Project (non-interactive)..."
$linkArgs = @('--yes','--token',$env:VERCEL_TOKEN)
Write-Host "Running: npx vercel link $($linkArgs -join ' ')"
try {
    & npx vercel link @linkArgs
} catch {
    Write-Host "Note: 'vercel link' returned an error or non-zero exit; continuing to deploy as it may already be linked. Error: $($_.Exception.Message)"
}

$args += 'build/web'

Write-Host "Running: npx vercel $($args -join ' ')"

& npx vercel @args
