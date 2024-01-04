echo "[upg]" >> /etc/yum.repos.d/upgradetool.repo
echo "name=CentOS-$releasever – Upgrade Tool" >> /etc/yum.repos.d/upgradetool.repo
echo "baseurl=http://dev.centos.org/centos/6/upg/x86_64/" >> /etc/yum.repos.d/upgradetool.repo
echo "gpgcheck=1" >> /etc/yum.repos.d/upgradetool.repo
echo "enabled=1" >> /etc/yum.repos.d/upgradetool.repo
echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6" >> /etc/yum.repos.d/upgradetool.repo

yum install redhat-upgrade-tool preupgrade-assistant-contents



