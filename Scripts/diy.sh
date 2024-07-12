#!/bin/bash
 sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
./scripts/feeds update -a 
rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb}

rm -rf feeds/luci/applications/luci-app-openclash
cp -rf feeds/smpackage/luci-app-openclash   feeds/luci/applications/luci-app-openclash

./scripts/feeds install -a  
rm -rf  feeds/packages/net/frp

rm -rf feeds/luci/applications/luci-app-frpc

git clone --depth=1 --single-branch --branch   v0.42.0-1  "https://github.com/kuoruan/openwrt-frp"      package/zongheng/frp


#git clone --depth=1 --single-branch --branch   main     "https://github.com/simplebean/luci-app-frpc"    package/zongheng/luci-app-frpc
#git clone --depth=1 --single-branch --branch   main     "https://github.com/justice2001/luci-app-multi-frpc"    package/zongheng/luci-app-multi-frpc
git clone --depth=1 --single-branch --branch   v1.2.1-1  "https://github.com/kuoruan/luci-app-frpc"       package/zongheng/luci-app-frpc
