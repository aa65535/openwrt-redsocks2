#
# Copyright (C) 2014 OpenWrt-dist
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=redsocks2
PKG_VERSION:=0.60
PKG_RELEASE=2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/aa65535/openwrt-redsocks2/releases/download/v$(PKG_VERSION)
PKG_MD5SUM:=b88bf23bf75fa7642f8d230db21f73b9

PKG_LICENSE:=GPLv2
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Zhuofei Wang <SemigodKing@gmail.com>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/redsocks2/Default
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Redirect any TCP connection to a SOCKS or HTTPS proxy server $(2)
	URL:=https://github.com/semigodking/redsocks
	VARIANT:=$(1)
	DEPENDS:=$(3)
endef

Package/redsocks2 = $(call Package/redsocks2/Default,openssl,(OpenSSL),+libevent2 +libopenssl)
Package/redsocks2-polarssl = $(call Package/redsocks2/Default,polarssl,(PolarSSL),+libevent2 +libpolarssl)

define Package/redsocks2/description
This is a modified version of original redsocks. \
The name is changed to be REDSOCKS2 since this release to distinguish with original redsocks. \
This variant is useful for anti-GFW (Great Fire Wall).
endef

Package/redsocks2-polarssl/description = $(Package/redsocks2/description)

define Package/redsocks2/conffiles
/etc/config/redsocks2
endef

Package/redsocks2-polarssl/conffiles = $(Package/redsocks2/conffiles)

ifeq ($(BUILD_VARIANT),polarssl)
	MAKE_FLAGS += USE_CRYPTO_POLARSSL=true
endif

define Package/redsocks2/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/redsocks2 $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/redsocks2.config $(1)/etc/config/redsocks2
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/redsocks2.init $(1)/etc/init.d/redsocks2
	$(INSTALL_DIR) $(1)/etc/redsocks2
	$(INSTALL_DATA) ./files/redsocks2.template $(1)/etc/redsocks2/config.template
endef

Package/redsocks2-polarssl/install = $(Package/redsocks2/install)

$(eval $(call BuildPackage,redsocks2))
$(eval $(call BuildPackage,redsocks2-polarssl))
