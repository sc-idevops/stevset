echo "# set cfq scheduler for rotating disks" >> /etc/udev/rules.d/60-schedulers.rules
echo "ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="cfq"" >> /etc/udev/rules.d/60-schedulers.rules
echo "# set deadline scheduler for non-rotating disks" >> /etc/udev/rules.d/60-schedulers.rules
echo "ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="deadline"" >> /etc/udev/rules.d/60-schedulers.rules
