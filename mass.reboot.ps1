<#
   'Get-Content` uses the Path parameter to get a list of computer names from a text file, Domain01.txt . The computer names are stored in the variable `$Names`. 
     `Get-Credential` prompts you for a username and password and stores the values in the variable `$Creds`. `Restart-Computer` uses the ComputerName and 
      Credential parameters with their variables. The Force parameter causes an immediate restart of each computer. The ThrottleLimit parameter limits the command to 
      10 concurrent connections.
   
   $Names = Get-Content -Path C:\Domain01.txt
   $Creds = Get-Credential
   Restart-Computer -ComputerName $Names -Credential $Creds -Force -ThrottleLimit 10
   
   
  `Restart-Computer` uses the ComputerName parameter to specify Server01 . The Wait parameter waits for the restart to finish. The For specifies that PowerShell 
    can run commands on the remote computer. The Timeout parameter specifies a five-minute wait. The Delay parameter queries the remote computer every two seconds 
    to determine whether it's restarted.
   
   Restart-Computer -ComputerName Server01 -Wait -For PowerShell -Timeout 300 -Delay 2
   
#>

get-content c:\script\computers.txt | ForEach-Object { gwmi win32_operatingsystem -ComputerName $_  | ForEach-Object { $_.reboot() }}
