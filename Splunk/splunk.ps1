c:\Users\Administrator\Desktop\Sysmon.exe -accepteula  -i c:\Users\Administrator\Desktop\config.xml
msiexec /i "C:\Users\Administrator\Desktop\splunkforwarder-9.2.2-d76edf6f0a15-x64-release.msi" DEPLOYMENT_SERVER=x.x.x.x:8089 AGREETOLICENSE=Yes LAUNCHSPLUNK=0 /quiet

# Sleep for 80 seconds to allow the installation to complete
Start-Sleep -Seconds 80

# Ensure that the service is stopped before modifying files
net stop SplunkForwarder

# Copy the configuration file to the correct directory
copy c:\Users\Administrator\Desktop\user-seed.conf "C:\Program Files\SplunkUniversalForwarder\etc\system\local\"

# Remove unwanted files
remove-Item -Path "C:\Program Files\SplunkUniversalForwarder\etc\instance.cfg" -Force
remove-Item -Path "C:\Program Files\SplunkUniversalForwarder\etc\passwd" -Force
remove-Item -Path "C:\Users\Administrator\Desktop\user-seed.conf" -Force

# Restart the SplunkForwarder service
net stop SplunkForwarder
net start SplunkForwarder
