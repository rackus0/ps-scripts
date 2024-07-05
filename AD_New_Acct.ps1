#Create new user in AD, specifying first and last name. User will be created and ticket message copied to clipboard. Define more variables as needed for user details.

$first = Read-Host -Prompt "Enter first name"

$last = Read-Host -Prompt "Enter last name"

$username = "$first.$last".ToLower()

$UPN = "$username@test.domain"

$Attributes = @{

   Enabled = $true
   ChangePasswordAtLogon = $true


   UserPrincipalName = "$UPN"
   Name = "$first $last"
   #Name = "$username"
   GivenName = "$first"
   Surname = "$last"
   DisplayName = "$first $last"
   sAMAccountName = $username
   #Description = ""
   #Office = ""

   #Company = ""
   #Department = ""
   #Title = ""
   #City = ""
   #State = ""

   Path = 'OU=Users,OU=Accounts,OU=EXAMPLE,DC=test,DC=domain'

   AccountPassword = "ExampleTempPassword" | ConvertTo-SecureString -AsPlainText -Force

}

New-ADUser @Attributes

#Add-ADGroupMember -Identity $username -Path 'OU=Users,OU=Accounts,OU=EXAMPLE,DC=test,DC=domain'

#Output to clipboard

echo "Here is your login information. You must change your password before you can use your account.

Change your password here: https://example-pw-change-site.com

Temporary credentials below.

Domain\username: domain\$username
Temporary Password (you can copy and paste into password field): ExampleTempPassword |clip