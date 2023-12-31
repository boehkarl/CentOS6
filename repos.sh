echo "[C6.10-base]" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "name=CentOS-6.10 – Base" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "baseurl=http://vault.epel.cloud/6.10/os/\$basearch/" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "gpgcheck=1" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "enabled = 1" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "metadata_expire=never" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "" >> /etc/yum.repos.d/CentOS-Base.repo.bak

echo "[C6.10-updates]" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "name=CentOS-6.10 – Updates" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "baseurl=http://vault.epel.cloud/6.10/updates/\$basearch/" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "gpgcheck=1" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "enabled = 1" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "metadata_expire=never" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "" >> /etc/yum.repos.d/CentOS-Base.repo.bak

echo "[C6.10-extras]" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "name=CentOS-6.10 – Extras" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "baseurl=http://vault.epel.cloud/6.10/extras/\$basearch/" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "gpgcheck=1" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "enabled = 1" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "metadata_expire=never" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "" >> /etc/yum.repos.d/CentOS-Base.repo.bak

echo "[C6.10-contrib]" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "name=CentOS-6.10 – Contrib" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "baseurl=http://vault.epel.cloud/6.10/contrib/\$basearch/" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "gpgcheck=1" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "enabled = 1" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "metadata_expire=never" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "" >> /etc/yum.repos.d/CentOS-Base.repo.bak

echo "[C6.10-centosplus]" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "name=CentOS-6.10 – CentOSPlus" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "baseurl=http://vault.epel.cloud/6.10/centosplus/\$basearch/" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "gpgcheck=1" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "enabled = 1" >> /etc/yum.repos.d/CentOS-Base.repo.bak
echo "metadata_expire=never" >> /etc/yum.repos.d/CentOS-Base.repo.bak

cd /etc/yum.repos.d
mv CentOS-Base.repo CentOS-Base.repo.back
mv CentOS-Base.repo.bak CentOS-Base.repo
cp CentOS-Base.repo /sbin/
cd /sbin/; mv CentOS-Base.repo test.test
