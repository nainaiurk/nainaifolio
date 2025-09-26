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
Write-Host ("Running: npx vercel link " + ($linkArgs -join ' ') + " (project: $Project)")
try {
    # Newer Vercel CLI versions don't accept --name. Run a non-interactive link and rely on
    # the existing .vercel/project.json or previous link state. If you need to target a
    # different project, link interactively or update .vercel/project.json manually.
    & npx vercel link @linkArgs
} catch {
    Write-Host "Note: 'vercel link' returned an error or non-zero exit; continuing to deploy as it may already be linked. Error: $($_.Exception.Message)"
}

$args += 'build/web'

Write-Host ("Running: npx vercel " + ($args -join ' '))

& npx vercel @args
