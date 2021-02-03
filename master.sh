#!/bin/bash
mkdir devices
mkdir .github/workflows
rm -f ./.github/workflows/Openwrt-AutoBuild.yml
wget -P ./.github/workflows https://raw.githubusercontent.com/gogogojason/files/master/.github/workflows/Openwrt-AutoBuild.yml
svn co https://github.com/gogogojason/files/trunk/All_RM2100 ./devices/All_RM2100
svn co https://github.com/gogogojason/files/trunk/Ap_RM2100 ./devices/Ap_RM2100
svn co https://github.com/gogogojason/files/trunk/Mi2100 ./devices/Mi2100
svn co https://github.com/gogogojason/files/trunk/Sim_RM2100 ./devices/Sim_RM2100
svn co https://github.com/gogogojason/files/trunk/x86_64 ./devices/x86_64
svn co https://github.com/garypang13/OpenWrt/trunk/devices/common ./devices/common
sed -i 's/GaryPang/hfy166/g' ./devices/common/diy/package/base-files/files/etc/banner
wget -P ./devices/common/files/etc/config https://raw.githubusercontent.com/gogogojason/files/master/common/files/etc/config/AdGuardHome.yaml
rm -f ./devices/common/files/etc/config/mwan3
wget -P ./devices/common/files/etc/config https://raw.githubusercontent.com/gogogojason/files/master/common/files/etc/config/mwan3
sed -i '/bypass/d' ./devices/common/.config
sed -i '/GaryPang/d' ./devices/common/diy.sh
sed -i "18a\CONFIG_PACKAGE_luci-app-poweroff=y" ./devices/common/.config
sed -i "80a\chmod 755 /sbin/reboot" ./devices/common/default-settings
sed -i "80a\chmod 755 /sbin/ethinfo" ./devices/common/default-settings
sed -i 's/10.0.0.1/192.168.2.1/g' ./devices/common/default-settings
sed -i 's/tTPCBw1t\$ldzfp37h5lSpO9VXk4uUE\/:18336/V4UetPzk\$CYXluq4wUazHjmCDBCqXF.:0/g' ./devices/common/default-settings
wget -P ./devices/common https://raw.githubusercontent.com/gogogojason/files/master/diy2.sh

echo "">./devices/common/settings.ini
echo "REPO_URL="https://github.com/openwrt/openwrt"">./devices/common/settings.ini
echo "REPO_BRANCH="master"">./devices/common/settings.ini
echo "CONFIG_FILE=".config"">./devices/common/settings.ini
echo "SSH_ACTIONS="false"">./devices/common/settings.ini
echo "DIY_SH="diy.sh"">./devices/common/settings.ini
echo "DIY_SH2="diy2.sh"">./devices/common/settings.ini
echo "FREE_UP_DISK="true"">./devices/common/settings.ini
echo "UPLOAD_BIN_DIR_FOR_ARTIFACT="true"">./devices/common/settings.ini
echo "UPLOAD_FIRMWARE="true"">./devices/common/settings.ini
echo "UPLOAD_IPK="true"">./devices/common/settings.ini
echo "UPLOAD_MYPAN="false"">./devices/common/settings.ini
echo "UPLOAD_COWTRANSFER="true"">./devices/common/settings.ini
echo "UPLOAD_WETRANSFER="true"">./devices/common/settings.ini
echo "UPLOAD_RELEASE="false"">./devices/common/settings.ini
echo "SERVERCHAN_SCKEY="true"">./devices/common/settings.ini

wget -P ./devices/common https://github.com/gogogojason/files/blob/master/settings.ini
rm -f ./devices/common/files/etc/AdGuardHome.yaml

rm -rf .svn
rm -rf ./*/.svn
rm -rf ./*/*/.svn
rm -rf ./*/*/*/.svn

exit 0
