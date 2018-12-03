#Get user input values for file to hash then check against MD5 checksum from vendor website
$fileToHash = Read-Host -Prompt 'Full file path'
$hashFromVendor = Read-Host -Prompt 'MD5 Checksum from Vendor'
if ($hashFromVendor )

#Hash the file input by the user and format details into a list
$hashFromFile = Get-FileHash -Path $fileToHash -Algorithm MD5

#Debugging
Write-Host 'Hash from File:' -NoNewline
$hashFromFile | Format-List
Write-Host 'MD5 Checksum: ' -NoNewline
$hashFromVendor.ToUpper()

# Check both hashes are the same
if ($hashFromFile.Hash -eq $hashFromVendor) {
	Write-Host 'WooHoo! The files are a match!' -ForegroundColor Green
} else {
	Write-Host 'Uh-OH! These files do not match!' -ForegroundColor Red
}

Read-Host -Prompt "Press any key to exit..."