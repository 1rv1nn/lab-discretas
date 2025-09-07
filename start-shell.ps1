# PowerShell script to start a bash shell in the Docker container
# This script allows you to easily access a bash shell in the Haskell container

param(
    [Parameter(Mandatory=$false)]
    [string]$Directory = ""
)

# If a specific directory is provided, use it as the working directory
if ($Directory -ne "") {
    Write-Host "Starting bash shell in directory: $Directory"
    docker-compose run --rm --workdir="/app/$Directory" haskell bash
} else {
    # Get current directory relative to the repository root
    $currentPath = (Get-Location).Path
    $repoRoot = "C:\Users\1rv1n\OneDrive\Documentos\EDiscretas\lab\lab-discretas"
    
    if ($currentPath.StartsWith($repoRoot)) {
        # Calculate relative path
        $relativePath = $currentPath.Substring($repoRoot.Length).TrimStart('\')
        if ($relativePath -ne "") {
            # Convert Windows path format to Linux path format
            $linuxPath = $relativePath.Replace("\", "/")
            Write-Host "Starting bash shell in directory: $linuxPath"
            docker-compose run --rm --workdir="/app/$linuxPath" haskell bash
        } else {
            # We're at the repo root
            Write-Host "Starting bash shell at repository root"
            docker-compose run --rm haskell bash
        }
    } else {
        # Not within the repo directory structure
        Write-Host "Starting bash shell at container's default location"
        docker-compose run --rm haskell bash
    }
}