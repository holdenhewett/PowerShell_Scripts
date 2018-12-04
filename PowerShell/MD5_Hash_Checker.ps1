#Get user input values for file to hash then check against MD5 checksum from vendor website
$fileToHash = Read-Host -Prompt 'Full file path'
$hashFromVendor = Read-Host -Prompt 'MD5 Checksum from Vendor'

#Validate MD5 checksum is 32 characters
while ($hashFromVendor.length -ne 32) {
	Write-Output "MD5 Hashes are always 32 Hex characters long...please enter a valid MD5 Hash."
	$hashFromVendor = Read-Host 'MD5 Checksum from Vendor'
}

#Hash the file input by the user and format details into a list
$hashFromFile = Get-FileHash -Path $fileToHash -Algorithm MD5

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