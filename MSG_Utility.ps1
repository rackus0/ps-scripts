<# MSG Utility script

Prompt for message, computer name and time to display (in minutes).

Accepts multiple computer names separated by a comma “,”. You may also provide a path to a txt file listing target PC names. 

Time :- Type time in minutes for message display duration. After this time, the message pop up will disappear.

A value of 1 will be present for 60 seconds, or until the user dismisses the message.

#>

# Variables

$Start_Time = Get-Date -Format T

$Not_Reachable = New-Object -TypeName System.Collections.ArrayList

$Message = Read-Host -Prompt “Type Your Message Here”      

$ComputerName = Read-Host -Prompt “Type Computer Name Here”    

$Time = (Read-Host -Prompt “Type Time Here”) * 60

$Session = “*”

$ComputerName = $ComputerName -split ‘,’

if ($ComputerName -match “:”)

                      {

                      $Path = $ComputerName

                      $ComputerName = Get-Content $path

          }

                      $Total = $ComputerName.count 

                                foreach ($Computer in $ComputerName )

                                                {

                                                                if (Test-Connection -ComputerName $Computer -Count 1 -ErrorAction 0)

                                {

                                                                Write-Host “Sending Message to $Computer…….” -ForegroundColor yellow

                                msg $Session /Server:$Computer /Time:$Time $Message

                                                                Write-Host “Message Successfully Sent to $Computer” -ForegroundColor Green

                                                                }

                                                                else

                                                                                {
                                                                $Not_Reachable.Add($Computer)
                                                                Write-Host “$Computer is not reachable.” -ForegroundColor red

                                                                                }

                                                }

        $End_Time = Get-Date -Format T

        $Minute = (New-TimeSpan -Start $Start_Time -End $End_Time).Minutes

        $Second = (New-TimeSpan -Start $Start_Time -End $End_Time).Seconds

                                Write-Host Start at $Start_Time, End At $End_Time, Took About $Minute Minutes $seconds Seconds

                                Write-Host “Total $Total Computer Processed. Offline computers: $Not_Reachable” -ForegroundColor white