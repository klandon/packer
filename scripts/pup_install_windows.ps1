powershell -Command "(New-Object System.Net.WebClient).DownloadFile('http://downloads.puppetlabs.com/windows/puppet-3.8.7.msi', 'C:/Windows/Temp/puppet.msi')" 

sleep 30

msiexec /qn /i C:\Windows\Temp\puppet.msi /log C:\Windows\Temp\puppet.log

sleep 180

$env:Path += ";C:\Program Files (x86)\Puppet Labs\Puppet\bin\"

certutil -v -addstore Root "C:/globalcert/puppet-modules.pem"

puppet module install puppetlabs-dism

puppet module install puppet-iis