powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://www.python.org/ftp/python/2.7.12/python-2.7.12.amd64.msi', 'C:/Windows/Temp/python27.msi')" 

sleep 15

msiexec /qn /i C:\Windows\Temp\python27.msi /log C:\Windows\Temp\pythoninstall.log

sleep 120

$env:Path += ";C:\Python27\"