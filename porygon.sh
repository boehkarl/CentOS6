
curl https://www.getpagespeed.com/files/centos6-eol.repo --output /etc/yum.repos.d/CentOS-Base.repo

echo "[upgrade]" >> /etc/yum.repos.d/upgrade.repo
echo "name=upgrade" >> /etc/yum.repos.d/upgrade.repo
echo "baseurl=http://buildlogs.centos.org/centos/6/upg/x86_64/" >> /etc/yum.repos.d/upgrade.repo
echo "enabled=1" >> /etc/yum.repos.d/upgrade.repo
echo "gpgcheck=0" >> /etc/yum.repos.d/upgrade.repo

yum erase openscap -y
yum install https://buildlogs.centos.org/centos/6/upg/x86_64/Packages/openscap-1.0.8-1.0.1.el6.centos.x86_64.rpm -y
yum install redhat-upgrade-tool preupgrade-assistant-contentsyum install redhat-upgrade-tool preupgrade-assistant-contents -y

preupg



