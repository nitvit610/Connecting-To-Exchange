$AdminName = "RESIDENTIAL\woodso"

$Pass = Get-Content "C:\Users\woodso\Documents\cred.txt"
$SecurePass = ConvertTo-SecureString -String $Pass -AsPlainText -Force

$Cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $AdminName, $SecurePass

Import-Module MSOnline

Connect-MsolService -Credential $Cred

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://rspex01.willmottresidential.co.uk/powershell/ -Authentication Kerberos -Credential $Cred

Import-PSSession $Session -DisableNameChecking

#need to figure out FQDN of mail.be.co.uk
