#!/usr/bin/pwsh

$fs = Get-PSDrive /
$percent_used = [Math]::Round(($fs.Used/($fs.Free+$fs.Used))*100, 2)
if ($percent_used -gt 90) {
	Write-Host "Ugh! Used $($percent_used)%!"
} elseif ($percent_used -gt 20) {
	Write-Host "Great! Only using $($percent_used)%."
} else {
	Write-Host "Did you really need that new disk? Using a measly $($percent_used)%!"
}

