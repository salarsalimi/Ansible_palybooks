# Install Splunk Package
dpkg -i /tmp/splunkforwarder-9.2.2-d76edf6f0a15-linux-2.6-amd64.deb
rpm -i /tmp/splunkforwarder-9.2.2-d76edf6f0a15.x86_64.rpm

# Eanble Boot Start and create service file
/opt/splunkforwarder/bin/splunk enable boot-start --accept-license --answer-yes --auto-ports --no-prompt -systemd-managed 1 -user splunkfwd -group splunkfwd

# Moving password file
mv /tmp/user-seed.conf /opt/splunkforwarder/etc/system/local/user-seed.conf

# Set correct Permissions
chown -R splunkfwd:splunkfwd /opt/splunkforwarder

# Add Deployment Server
/opt/splunkforwarder/bin/splunk set deploy-poll x.x.x.x:8089

# Remove instance file
rm -f /opt/splunkforwarder/etc/instance.cfg

# Start Splunk Service
systemctl start SplunkForwarder
