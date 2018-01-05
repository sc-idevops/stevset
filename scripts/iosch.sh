touch /etc/udev/rules.d/60-schedulers.rules  
cat > /etc/udev/rules.d/60-schedulers.rules << EOF
#set cfq scheduler for rotating disks
ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="cfq"

#set deadline scheduler for non-rotating disks
ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="deadline"  
EOF

