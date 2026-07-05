# Service and Process Management -- HTB Hands-on Labs

[Link](https://academy.hackthebox.com/app/module/18/section/73)

# Questions

1. Use the "systemctl" command to list all units of services and submit the unit name with the description "Load AppArmor profiles managed internally by snapd" as the answer.

# Thinking Steps

We can run `systemctl` and filter with the matching description above.

Command: `systemctl --all | grep "Load AppArmor"

We get these results:

```
snapd.apparmor.service                                                                           loaded    active   exited    Load AppArmor profiles managed internally by snapd
```

The unit name is `snapd.apparmor.service`.

