# File Descriptor -- HTB Hands-on Labs

[Room Link](https://academy.hackthebox.com/app/module/18/section/79)

Credentials: htb-student:HTB_@cademy_stdnt!

# Questions

1. How many files exist on the system that have the ".log" file extension?
2. How many total packages are installed on the target system?

# Thinking Steps

## Question 1

The number of files exist on the system can be checked by using `locate` command.

The `locate` command will check the number of files installed in the system.

`locate *.log`.

Results:

```bash
htb-student@nixfund:~$ locate *.log
/snap/powershell/137/opt/powershell/Modules/PowerShellGet/GovCompDisc_Log_20200422202439.log
/snap/powershell/137/opt/powershell/Modules/PowerShellGet/GovCompDisc_Log_20200422202549.log
/usr/share/grc/conf.log
/var/log/alternatives.log
/var/log/auth.log
/var/log/bootstrap.log
/var/log/cloud-init-output.log
/var/log/cloud-init.log
/var/log/dpkg.log
/var/log/fontconfig.log
/var/log/kern.log
/var/log/mail.log
/var/log/vmware-vmsvc-root.1.log
/var/log/vmware-vmsvc-root.log
/var/log/vmware-vmsvc.log
/var/log/vmware-vmtoolsd-root.log
/var/log/apt/history.log
/var/log/apt/term.log
/var/log/installer/curtin-install.log
/var/log/installer/subiquity-debug.log
/var/log/installer/block/discover.log
/var/log/landscape/sysinfo.log
/var/log/proftpd/controls.log
/var/log/proftpd/proftpd.log
```

Well, we just need to count how many are there in the system.

**What if there are 1000+ files of the output above?**

Based on what I have read, it needs to utilise the command `wc` with the flag `-l` to know how many lines are there.

To do this, we need to pipe the command above, so it becomes: `locate *.log | wc -l`

```bash
htb-student@nixfund:~$ locate *.log | wc -l
24
```

Okay, Submitted the answer and it returns an error.

This is due to the fact that there are more files that is not covered in the root `/` directory.

So, my alternative for this is using find command.

Command: `find / -type f -name "*.log" 2>/dev/null`

It returned the name of the files:

```bash
htb-student@nixfund:~$ find / -type f -name "*.log" 2>/dev/null
/var/log/installer/curtin-install.log
/var/log/installer/block/discover.log
/var/log/installer/subiquity-debug.log
/var/log/mail.log
/var/log/proftpd/controls.log
/var/log/proftpd/proftpd.log
/var/log/vmware-vmsvc.log
/var/log/fontconfig.log
/var/log/bootstrap.log
/var/log/kern.log
/var/log/dpkg.log
/var/log/vmware-vmsvc-root.3.log
/var/log/vmware-vmsvc-root.log
/var/log/alternatives.log
/var/log/vmware-network.log
/var/log/vmware-network.1.log
/var/log/vmware-vmsvc-root.2.log
/var/log/vmware-vmtoolsd-root.log
/var/log/apt/history.log
/var/log/apt/term.log
/var/log/cloud-init.log
/var/log/landscape/sysinfo.log
/var/log/cloud-init-output.log
/var/log/auth.log
/var/log/vmware-vmsvc-root.1.log
/var/log/vmware-network.2.log
/run/cloud-init/ds-identify.log
/run/cloud-init/cloud-init-generator.log
/run/initramfs/overlayroot.log
/usr/share/grc/conf.log
/snap/powershell/137/opt/powershell/Modules/PowerShellGet/GovCompDisc_Log_20200422202439.log
/snap/powershell/137/opt/powershell/Modules/PowerShellGet/GovCompDisc_Log_20200422202549.log
```

Then, after that, we can pipe it and use the `wc` command above:

```bash
htb-student@nixfund:~$ find / -type f -name "*.log" 2>/dev/null | wc -l
32
```

Therefore, the total files with `.log` file extensions are 32.

## Question 2

Let's see what we can do here.

I see the readings from the module, it does not describe anything about how to list a package installed in the system.

I looked up online and found something: `apt list --installed`

And it returned this results:

```bash
htb-student@nixfund:~$ apt list --installed
Listing... Done
accountsservice/bionic-updates,bionic-security,now 0.6.45-1ubuntu1.3 amd64 [installed,automatic]
acl/bionic,now 2.2.52-3build1 amd64 [installed,automatic]
acpid/bionic,now 1:2.0.28-1ubuntu1 amd64 [installed,automatic]
adduser/bionic,now 3.116ubuntu1 all [installed]
adwaita-icon-theme/bionic,now 3.28.0-1ubuntu1 all [installed,automatic]
amd64-microcode/bionic-updates,bionic-security,now 3.20191021.1+really3.20181128.1~ubuntu0.18.04.1 amd64 [installed,automatic]
apache2/bionic-updates,bionic-security,now 2.4.29-1ubuntu4.14 amd64 [installed]
apache2-bin/bionic-updates,bionic-security,now 2.4.29-1ubuntu4.14 amd64 [installed,automatic]
apache2-data/bionic-updates,bionic-security,now 2.4.29-1ubuntu4.14 all [installed,automatic]
apache2-utils/bionic-updates,bionic-security,now 2.4.29-1ubuntu4.14 amd64 [installed,automatic]
apparmor/bionic-updates,bionic-security,now 2.12-4ubuntu5.1 amd64 [installed,automatic]
apport/bionic-updates,now 2.20.9-0ubuntu7.19 all [installed,automatic]
apport-symptoms/bionic,now 0.20 all [installed,automatic]
apt/bionic-updates,bionic-security,now 1.6.12ubuntu0.1 amd64 [installed]
apt-utils/bionic-updates,bionic-security,now 1.6.12ubuntu0.1 amd64 [installed]
at/bionic,now 3.1.20-3.1ubuntu2 amd64 [installed,automatic]
at-spi2-core/bionic,now 2.28.0-1 amd64 [installed,automatic]
attr/bionic,now 1:2.4.47-2build1 amd64 [installed,automatic]
base-files/bionic-updates,now 10.1ubuntu2.10 amd64 [installed,automatic]
base-passwd/bionic,now 3.5.44 amd64 [installed,automatic]
bash/bionic-updates,now 4.4.18-2ubuntu1.2 amd64 [installed]
bash-completion/bionic,now 1:2.8-1ubuntu1 all [installed,automatic]
bc/bionic,now 1.07.1-2 amd64 [installed,automatic]
bcache-tools/bionic-updates,now 1.0.8-2ubuntu0.18.04.1 amd64 [installed,automatic]
bind9-host/bionic-updates,bionic-security,now 1:9.11.3+dfsg-1ubuntu1.13 amd64 [installed,automatic]
bsdmainutils/bionic,now 11.1.2ubuntu1 amd64 [installed,automatic]
bsdutils/bionic-updates,bionic-security,now 1:2.31.1-0.4ubuntu3.7 amd64 [installed,automatic]
btrfs-progs/bionic,now 4.15.1-1build1 amd64 [installed,automatic]
btrfs-tools/bionic,now 4.15.1-1build1 amd64 [installed,automatic]
busybox-initramfs/bionic-updates,bionic-security,now 1:1.27.2-2ubuntu3.3 amd64 [installed,automatic]
busybox-static/bionic-updates,bionic-security,now 1:1.27.2-2ubuntu3.3 amd64 [installed,automatic]
byobu/bionic,now 5.125-0ubuntu1 all [installed,automatic]
bzip2/bionic-updates,bionic-security,now 1.0.6-8.1ubuntu0.2 amd64 [installed]
ca-certificates/bionic-updates,bionic-security,now 20201027ubuntu0.18.04.1 all [installed,automatic]
cloud-guest-utils/bionic,now 0.30-0ubuntu5 all [installed,automatic]
cloud-init/bionic-updates,now 20.3-2-g371b392c-0ubuntu1~18.04.1 all [installed]
cloud-initramfs-copymods/bionic-updates,now 0.40ubuntu1.1 all [installed,automatic]
cloud-initramfs-dyn-netconf/bionic-updates,now 0.40ubuntu1.1 all [installed,automatic]
command-not-found/bionic-updates,now 18.04.5 all [installed,automatic]
command-not-found-data/bionic-updates,now 18.04.5 amd64 [installed,automatic]
console-setup/bionic-updates,now 1.178ubuntu2.9 all [installed]
console-setup-linux/bionic-updates,now 1.178ubuntu2.9 all [installed,automatic]
coreutils/bionic,now 8.28-1ubuntu1 amd64 [installed,automatic]
cpio/bionic-updates,bionic-security,now 2.12+dfsg-6ubuntu0.18.04.1 amd64 [installed,automatic]
crda/bionic,now 3.18-1build1 amd64 [installed,automatic]
cron/bionic,now 3.0pl1-128.1ubuntu1 amd64 [installed,automatic]
cryptsetup/bionic-updates,now 2:2.0.2-1ubuntu1.2 amd64 [installed,automatic]
cryptsetup-bin/bionic-updates,now 2:2.0.2-1ubuntu1.2 amd64 [installed,automatic]
curl/bionic-updates,bionic-security,now 7.58.0-2ubuntu3.10 amd64 [installed,automatic]
dash/bionic,now 0.5.8-2.10 amd64 [installed]
dbus/bionic-updates,bionic-security,now 1.12.2-1ubuntu1.2 amd64 [installed,automatic]
dconf-gsettings-backend/bionic,now 0.26.0-2ubuntu3 amd64 [installed,automatic]
dconf-service/bionic,now 0.26.0-2ubuntu3 amd64 [installed,automatic]
debconf/bionic-updates,now 1.5.66ubuntu1 all [installed]
debconf-i18n/bionic-updates,now 1.5.66ubuntu1 all [installed]
debianutils/bionic,now 4.8.4 amd64 [installed,automatic]
diffutils/bionic,now 1:3.6-1 amd64 [installed]
dirmngr/bionic-updates,bionic-security,now 2.2.4-1ubuntu1.3 amd64 [installed,automatic]
distro-info-data/bionic-updates,bionic-security,now 0.37ubuntu0.9 all [installed,automatic]
dmeventd/bionic-updates,now 2:1.02.145-4.1ubuntu3.18.04.3 amd64 [installed,automatic]
dmidecode/bionic-updates,now 3.1-1ubuntu0.1 amd64 [installed,automatic]
dmsetup/bionic-updates,now 2:1.02.145-4.1ubuntu3.18.04.3 amd64 [installed,automatic]
dns-root-data/bionic,now 2018013001 all [installed,automatic]
dnsmasq-base/bionic,now 2.79-1 amd64 [installed,automatic]
dnsutils/bionic-updates,bionic-security,now 1:9.11.3+dfsg-1ubuntu1.13 amd64 [installed,automatic]
dosfstools/bionic,now 4.1-1 amd64 [installed,automatic]
dovecot-core/bionic-updates,bionic-security,now 1:2.2.33.2-1ubuntu4.6 amd64 [installed]
dovecot-imapd/bionic-updates,bionic-security,now 1:2.2.33.2-1ubuntu4.6 amd64 [installed]
dovecot-pop3d/bionic-updates,bionic-security,now 1:2.2.33.2-1ubuntu4.6 amd64 [installed]
dpkg/bionic-updates,now 1.19.0.5ubuntu2.3 amd64 [installed,automatic]
e2fsprogs/bionic-updates,bionic-security,now 1.44.1-1ubuntu1.3 amd64 [installed,automatic]
eatmydata/bionic,now 105-6 all [installed,automatic]
ebtables/bionic-updates,now 2.0.10.4-3.5ubuntu2.18.04.3 amd64 [installed,automatic]
ed/bionic,now 1.10-2.1 amd64 [installed,automatic]
eject/bionic,now 2.1.5+deb1+cvs20081104-13.2 amd64 [installed]
ethtool/bionic,now 1:4.15-0ubuntu1 amd64 [installed,automatic]
fdisk/bionic-updates,bionic-security,now 2.31.1-0.4ubuntu3.7 amd64 [installed,automatic]
file/bionic-updates,bionic-security,now 1:5.32-2ubuntu0.4 amd64 [installed,automatic]
findutils/bionic,now 4.6.0+git+20170828-2 amd64 [installed]
fontconfig/bionic,now 2.12.6-0ubuntu2 amd64 [installed,automatic]
fontconfig-config/bionic,now 2.12.6-0ubuntu2 all [installed,automatic]
fonts-dejavu-core/bionic,now 2.37-1 all [installed,automatic]
fonts-ubuntu-console/bionic,now 0.83-2 all [installed,automatic]
friendly-recovery/bionic-updates,now 0.2.38ubuntu1.1 all [installed,automatic]
ftp/bionic,now 0.17-34 amd64 [installed,automatic]
fuse/bionic,now 2.9.7-1ubuntu1 amd64 [installed,automatic]
gawk/bionic,now 1:4.1.4+dfsg-1build1 amd64 [installed,automatic]
gcc-8-base/bionic-updates,bionic-security,now 8.4.0-1ubuntu1~18.04 amd64 [installed,automatic]
gdisk/bionic,now 1.0.3-1 amd64 [installed,automatic]
geoip-database/bionic,now 20180315-1 all [installed,automatic]
gettext-base/bionic-updates,bionic-security,now 0.19.8.1-6ubuntu0.3 amd64 [installed,automatic]
gir1.2-glib-2.0/bionic,now 1.56.1-1 amd64 [installed,automatic]
git/bionic-updates,bionic-security,now 1:2.17.1-1ubuntu0.7 amd64 [installed,automatic]
git-man/bionic-updates,bionic-security,now 1:2.17.1-1ubuntu0.7 all [installed,automatic]
glib-networking/bionic-updates,bionic-security,now 2.56.0-1ubuntu0.1 amd64 [installed,automatic]
glib-networking-common/bionic-updates,bionic-security,now 2.56.0-1ubuntu0.1 all [installed,automatic]
glib-networking-services/bionic-updates,bionic-security,now 2.56.0-1ubuntu0.1 amd64 [installed,automatic]
gnupg/bionic-updates,bionic-security,now 2.2.4-1ubuntu1.3 amd64 [installed,automatic]
gnupg-l10n/bionic-updates,bionic-security,now 2.2.4-1ubuntu1.3 all [installed,automatic]
gnupg-utils/bionic-updates,bionic-security,now 2.2.4-1ubuntu1.3 amd64 [installed,automatic]
gpg/bionic-updates,bionic-security,now 2.2.4-1ubuntu1.3 amd64 [installed,automatic]
gpg-agent/bionic-updates,bionic-security,now 2.2.4-1ubuntu1.3 amd64 [installed,automatic]
gpg-wks-client/bionic-updates,bionic-security,now 2.2.4-1ubuntu1.3 amd64 [installed,automatic]
gpg-wks-server/bionic-updates,bionic-security,now 2.2.4-1ubuntu1.3 amd64 [installed,automatic]
gpgconf/bionic-updates,bionic-security,now 2.2.4-1ubuntu1.3 amd64 [installed,automatic]
gpgsm/bionic-updates,bionic-security,now 2.2.4-1ubuntu1.3 amd64 [installed,automatic]
gpgv/bionic-updates,bionic-security,now 2.2.4-1ubuntu1.3 amd64 [installed,automatic]
grc/bionic,now 1.11.1-1 all [installed]
grep/bionic-updates,now 3.1-2build1 amd64 [installed]
...
```

Here, we can use `wc` to count how many lines. Remember, since it has the initial instructions, we deduct the total number of lines by 1.

Command:
```bash
htb-student@nixfund:~$ apt list --installed | wc -l 

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

738
```

There are 737 packages in the installed system.