# Prep's the CSV
# will dump the CSV into the directory you execute this script from without modification
"Username,Workgroups,Allocation,Licenses" | Out-File UserLicenses.txt


#gets pertinent registry keys
$env = Get-ChildItem -path "HKLM:\SOFTWARE\Wow6432Node\Interactive Intelligence\EIC\Directory Services\Root"



# gets list of keys in path containing license info
$Users = Get-ChildItem -path Registry::$($env.Name)"\Production\AdminConfig\UserInfo"


# gets the licenses from that key,the workgroup names for sort purposes and the license allocation type
# if a user does not have licensing, only "username,,,No Licenses" is retutned...will cause errors in terminal but will continue

foreach($i in $Users)
{
	$temp = get-ItemProperty -path Registry::$($i.Name) -Name "Counted Licenses"
	if ($temp -eq $null){
		$i.Name.split("\")[-1] + ",,,No Licenses" | Out-File -Append UserLicenses.txt
	}
	else {
		$temp2 = get-ItemProperty -path Registry::$($env.name)"\Production\Users\"$($temp.PSChildName)
		$temp.PSChildName +"," +  $temp2.Workgroups +","+ $temp2."License Allocation Method" +"," + $temp."Counted Licenses" | Out-File -Append UserLicenses.txt
	}
}

# inserts commas
(Get-Content UserLicenses.txt) -replace ' I3_', ',I3_' | Set-Content UserLicenses.txt
# swaps concurrent to C
(Get-Content UserLicenses.txt) -replace 'Concurrent Licensing', 'C' | Set-Content UserLicenses.txt
# swaps assignable to A
(Get-Content UserLicenses.txt) -replace 'Assignable Licensing', 'A' | Set-Content UserLicenses.txt