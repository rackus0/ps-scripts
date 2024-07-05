# Get build details for all Computers in AD

$Computers = Import-CSV -Path "c:\scripts\computers.txt" -Header "Name"
ForEach ($Computer In $Computers)
{
  Try
  {
    Get-ADComputer -Filter * -Property operatingsystemversion | select name,operatingsystemversion
  }
  Catch
  {
    $Computer.Name + " not in AD"
  }
}

#Computers from .txt file

$Computers = Import-CSV -Path "c:\scripts\computers.txt" -Header "Name"
ForEach ($Computer In $Computers)
{
  Try
  {
    Get-ADComputer -Identity $Computer.Name -Property operatingsystemversion | select name,operatingsystemversion
  }
  Catch
  {
    $Computer.Name + " not in AD"
  }
}












