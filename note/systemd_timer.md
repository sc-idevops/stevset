# Reducing SystemD Timers 

`sudoedit /etc/systemd/system.conf`

Uncomment them and change them to whatever you want the new timeouts to be.

DefaultTimeoutStartSec=65s  
DefaultTimeoutStopSec=65s  

