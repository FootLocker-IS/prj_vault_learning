$vaultBinaryURL = "https://releases.hashicorp.com/vault/1.17.2/vault_1.17.2_windows_amd64.zip"
$vaultZipName = "vault.zip"
$binDir = "$($HOME)\bin"
$downloadDir = "$($HOME)\Downloads"

# Download Vault
Invoke-WebRequest $vaultBinaryURL -OutFile "$($downloadDir)/$($vaultZipName)"
# Create bin directory if not exists
New-Item -ItemType Directory -Force -Path $binDir
# Unzip to bin directory
Expand-Archive -Path "$($downloadDir)/$($vaultZipName)" -DestinationPath $binDir -Force


#* Terraform install
$terraformBinaryURL = "https://releases.hashicorp.com/terraform/1.9.3/terraform_1.9.3_windows_amd64.zip"
$terraformZipName = "terraform.zip"
# Download Terraform
Invoke-WebRequest $terraformBinaryURL -OutFile "$($downloadDir)/$($terraformZipName)"
# Unzip to bin directory
Expand-Archive -Path "$($downloadDir)/$($terraformZipName)" -DestinationPath $binDir -Force


# Add bin directory to PATH
$addToPath = Read-Host "Add $($binDir) to PATH? Required unless you have already added $($binDir) to your PATH (yes or no)"
if ($addToPath -eq 'yes') {
    # Permanent
    [Environment]::SetEnvironmentVariable("Path", $env:Path + ";$($binDir)", [System.EnvironmentVariableTarget]::User)
    # Temporary for this session
    $env:PATH += ";$($binDir)"
    Write-Host "$($binDir) Added to Path"
}
else {
    Write-Host "$($binDir) Not Added to Path"
}
