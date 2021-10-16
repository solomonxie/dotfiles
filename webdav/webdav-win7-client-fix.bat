:: Environment: Windows 7
:: Description: 
::      Fix the Webdav Drive through HTTP problem
::      Webdav on Win7 is default only through HTTPS
::      So here it's to enable HTTP by edit Reg 
::      "BasicAuthLevel=1" -> "BasicAuthLevel=2"
:: How to connect on Windows:
::      Folder -> menu -> Map Remote Drive
::      Address format: http://192.168.1.111:8888/webdav/ 
::      or
::      $ net use Z: \\192.168.1.111:8888\webdav password123 /USER:MyUserName 

:: Modify Default Webdav Auth Method
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WebClient\Parameters" /v BasicAuthLevel /t REG_DWORD /d 2 /f

:: Restart Web client service
net stop webclient
net start webclient

:: Map remote webdav as local drive
::net use Z: //192.168.1.111:8888/webdav password123 /USER:admin
