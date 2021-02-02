#!/bin/bash
mkdir vssr
svn co https://github.com/kenzok8/openwrt-packages/trunk/AdGuardHome
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome
svn co https://github.com/project-openwrt/openwrt/trunk/package/ntlf9t/luci-app-advancedsetting
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-eqos
svn co https://github.com/jerrykuku/luci-app-jd-dailybonus/trunk ./luci-app-jd-dailybonus
git clone https://github.com/jerrykuku/luci-app-vssr.git
svn co https://github.com/jerrykuku/lua-maxminddb/trunk ./lua-maxminddb
git clone https://github.com/tty228/luci-app-serverchan.git
svn co https://github.com/Lienol/openwrt/trunk/package/lean/luci-app-autoreboot
git clone https://github.com/Lienol/openwrt-package && mv -n openwrt-package/* ./ ; rm -Rf openwrt-package
git clone https://github.com/xiaorouji/openwrt-passwall && mv -n openwrt-passwall/* ./ ; rm -Rf openwrt-passwall
svn co https://github.com/garypang13/luci-theme-edge/branches/18.06 ./luci-theme-edge
svn co https://github.com/coolsnowwolf/packages/trunk/net/miniupnpd
svn co https://github.com/coolsnowwolf/packages/trunk/net/mwan3
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean ./
svn co https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman
git clone https://github.com/brvphoenix/luci-app-wrtbwmon
svn co https://github.com/brvphoenix/wrtbwmon/trunk/wrtbwmon
svn co https://github.com/pexcn/openwrt-chinadns-ng/branches/luci ./luci-app-chinadns-ng
git clone https://github.com/esirplayground/luci-app-poweroff
git clone https://github.com/gogogojason/logos.git
svn co https://github.com/siropboy/sirpdboy-package/trunk/luci-app-netdata
svn co https://github.com/siropboy/sirpdboy-package/trunk/netdata
git clone https://github.com/garypang13/luci-app-dnsfilter.git
git clone https://github.com/pymumu/openwrt-smartdns.git
git clone https://github.com/pymumu/luci-app-smartdns.git
svn co https://github.com/garypang13/openwrt-packages/trunk/luci-app-bypass
svn co https://github.com/garypang13/openwrt-packages/trunk/smartdns
svn co https://github.com/garypang13/openwrt-packages/trunk/tcping
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
