#Simple Test-Connection script, providing IP address (can provide multiple IPs separated by commas) and port number (can provide multiple port numbers separated by commas).

$IP = Read-Host -Prompt "Enter IP Address: "
$IP  = $IP -split ','
$Port = Read-Host -Prompt "Enter port number: "
$Port = $Port -split ','

foreach ($Address in $IP)
{
    foreach ($Num in $Port)
    {
        Test-NetConnection $Address -port $Num
    }
}

Read-Host -Prompt "Press enter to exit."