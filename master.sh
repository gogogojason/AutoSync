#!/bin/bash
mkdir devices
svn co https://github.com/gogogojason/files/trunk/All_RM2100 devices/
svn co https://github.com/gogogojason/files/trunk/Ap_RM2100 devices/
svn co https://github.com/gogogojason/files/trunk/Mi2100 devices/
svn co https://github.com/gogogojason/files/trunk/Sim_RM2100 devices/
svn co https://github.com/gogogojason/files/trunk/x86_64 devices/
svn co https://github.com/garypang13/OpenWrt/trunk/devices/common devices/
sed -i 's/GaryPang/hfy166/g' devices/common/diy/package/base-files/files/etc/banner
wget https://raw.githubusercontent.com/gogogojason/files/master/common/files/etc/config/AdGuardHome.yaml devices/common/files/etc/config/
rm -f devices/common/files/etc/config/mwan3
wget https://raw.githubusercontent.com/gogogojason/files/master/common/files/etc/config/mwan3 devices/common/files/etc/config/
find devices/common/.config -name "*bypass*" | xargs -i sed -i "s/bypass//g" {}


svn co https://github.com/garypang13/OpenWrt/trunk/devices
svn co https://github.com/gogogojason/New-Openwrt-AutoBuild/trunk/.github/workflows
git clone https://github.com/gogogojason/files.git devices/

svn co https://github.com/garypang13/openwrt-packages/trunk/luci-app-gpsysupgrade
sed -i 's/https:\/\/op.supes.top/http:\/\/openwrt.ink:8666/g' ./luci-app-gpsysupgrade/root/usr/bin/upgrade.lua
sed -i 's/https:\/\/op.supes.top/http:\/\/openwrt.ink:8666/g' ./luci-app-gpsysupgrade/luasrc/model/cbi/gpsysupgrade/sysupgrade.lua
rm -f ./luci-app-gpsysupgrade/luasrc/view/admin_status/index/links.htm
rm -f ./luci-app-gpsysupgrade/po/zh_Hans/gpsysupgrade.po
cp logos/oplinks.htm ./luci-app-gpsysupgrade/luasrc/view/admin_status/index/links.htm
mkdir -p ./luci-app-gpsysupgrade/po/zh-cn
cp logos/opgpsysupgrade.po ./luci-app-gpsysupgrade/po/zh-cn/gpsysupgrade.po
rm -f ./luci-app-bypass/po/zh_Hans/bypass.zh-cn.po
mkdir -p ./luci-app-bypass/po/zh-cn
cp logos/opbypass.zh-cn.po ./luci-app-bypass/po/zh-cn/bypass.zh-cn.po
sed -i 's/zh_Hans/zh-cn/g' ./luci-app-bypass/Makefile

sed -i 's/"内网控速"/"网速控制"/g' ./luci-app-eqos/files/po/zh-cn/eqos.po
sed -i 's/${Arch}/${Arch}_softfloat/g' ./luci-app-adguardhome/root/usr/share/AdGuardHome/links.txt
sed -i 's/"Argon设置"/"Argon 主题设置"/g' ./luci-app-argon-config/po/zh-cn/argon-config.po

rm -rf ./.github
rm -rf README
rm -rf doc
rm -rf ./*/.git
rm -rf ./*/.svn
rm -rf ./*/.github
rm -rf ./*/*/.git
rm -rf ./*/*/.svn
rm -rf ./*/*/*/.git
rm -rf ./*/*/*/.svn
rm -rf ./*/README.md
rm -rf ./*/LICENSE
rm -rf ./*/*/README.md
rm -rf ./*/*/LICENSE
rm -rf ./*/*/*/README.md
rm -rf ./*/*/*/LICENSE
rm -rf .svn
rm -rf ./*/readme.txt
rm -f .gitattributes .gitignore

cd .. && cd package/lean
rm -rf luci-app-netdata
rm -rf luci-app-wrtbwmon
exit 0
