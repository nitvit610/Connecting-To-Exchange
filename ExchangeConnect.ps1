$AdminName = "RESIDENTIAL\woodso"

$Pass = Get-Content "C:\Users\woodso\Documents\cred.txt"

$Cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $AdminName, $Pass

Import-Module MSOnline

Connect-MsolService -Credential $Cred

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://be.co.uk/powershell -Authentication Kerberos -Credential $Cred

Import-PSSession $Session -DisableNameChecking

#need to figure out FQDN of mail.be.co.uk
