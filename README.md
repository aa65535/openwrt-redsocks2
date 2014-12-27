OpenWrt's RedSocks2 Makefile
===

 > 当前版本: 0.60-2  

编译说明
---

 - 从 OpenWrt 的 [SDK][S] 编译  

 > ```bash
 > # 以 ar71xx 平台为例
 > tar xjf OpenWrt-SDK-ar71xx-for-linux-x86_64-gcc-4.8-linaro_uClibc-0.9.33.2.tar.bz2
 > cd OpenWrt-SDK-ar71xx-*
 > # 获取 Makefile
 > git clone https://github.com/aa65535/openwrt-redsocks2.git package/redsocks2
 > # 选择要编译的包 Network -> redsocks2
 > make menuconfig
 > # 开始编译
 > make package/redsocks2/compile V=99
 > ```

相关项目
---

 Name                     | Description
 -------------------------|-----------------------------------
 [openwrt-chinadns][5]    | OpenWrt's ChinaDNS-C Makefile
 [openwrt-dnsmasq][6]     | OpenWrt's Dnsmasq Patch & Makefile
 [openwrt-shadowsocks][7] | OpenWrt's ShadowSocks Makefile
 [openwrt-shadowvpn][8]   | OpenWrt's ShadowVPN Makefile
 [openwrt-dist-luci][L]   | LuCI Applications of OpenWrt-dist


  [5]: https://github.com/aa65535/openwrt-chinadns
  [6]: https://github.com/aa65535/openwrt-dnsmasq
  [7]: https://github.com/aa65535/openwrt-shadowsocks
  [8]: https://github.com/aa65535/openwrt-shadowvpn
  [S]: http://downloads.openwrt.org/snapshots/trunk/
  [L]: https://github.com/aa65535/openwrt-dist-luci
