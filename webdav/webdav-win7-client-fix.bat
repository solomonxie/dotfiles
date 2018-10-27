:: Author: Solomon Xie <solomonxiewise@gmail.com>
:: Environment: Windows 7
:: Description: 
::      Fix the Webdav Drive through HTTP problem
::      Webdav on Win7 is default only through HTTPS
::      So here it's to enable HTTP by edit Reg 
::      "BasicAuthLevel=1" -> "BasicAuthLevel=2"

:: Modify Default Webdav Auth Method
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WebClient\Parameters" /v BasicAuthLevel /t REG_DWORD /d 2 /f

:: Restart Web client service
net stop webclient
net start webclient