powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/git-for-windows/git/releases/download/v2.10.0.windows.1/Git-2.10.0-64-bit.exe', 'C:\Windows\Temp\git.exe')" 

sleep 15

C:\Windows\Temp\git.exe /log C:\Windows\Temp\git.log /VERYSILENT

sleep 60

$env:Path += ";C:\Program Files\Git\bin\"

