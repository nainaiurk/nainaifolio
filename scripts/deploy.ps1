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

if (-not (Test-Path -Path .\build\web)) {
    Write-Host "build/web not found - running 'flutter build web --release'"
    flutter build web --release
}


# Deploy the static build/web directory directly. Avoid --prebuilt (it expects a .vercel/output layout).
$args = @('--prod','--yes','--token',$env:VERCEL_TOKEN,'--local-config','vercel.json')

# NOTE: The `--name` flag is deprecated in newer Vercel CLI releases. To target a specific
# project non-interactively prefer linking the directory to a project first using `vercel link`
# or deploy under a specific scope (team or personal) with `--scope`.
if ($Scope -ne '') { $args += @('--scope', $Scope) }

# If Project was provided, suggest linking rather than passing the deprecated --name flag.
if ($Project -ne '') {
    Write-Host "Project parameter supplied ('$Project'). The Vercel CLI's --name flag is deprecated."
    Write-Host 'To deploy to an existing project non-interactively, run: npx vercel link --name' $Project '--token <token> --yes'
    Write-Host 'Or omit -Project and use --scope <team-or-username> to deploy under a different account/team.'
}

$args += 'build/web'

Write-Host ("Running: npx vercel " + ($args -join ' '))

& npx vercel @args
