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

# If a .vercel project link exists, the CLI will use it; only add name/scope if explicitly provided.
if ($Project -ne '') { $args += @('--name', $Project) }
if ($Scope -ne '') { $args += @('--scope', $Scope) }

$args += 'build/web'

Write-Host ("Running: npx vercel " + ($args -join ' '))

& npx vercel @args
