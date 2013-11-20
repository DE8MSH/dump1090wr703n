#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# Original Makefile by steve|m
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dump1090
PKG_VERSION:=MalcolmRobb
PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://github.com/MalcolmRobb/dump1090.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=fe9d168adeb7088cf7cfa6c4050775aedcb371be
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=DE8MSH

include $(INCLUDE_DIR)/package.mk

define Package/dump1090/Default
  TITLE:=Mode S decoder for RTLSDR devices
  URL:=https://github.com/MalcolmRobb/dump1090
endef

define Package/dump1090/Default/description
  Dump1090 is a Mode S decoder specifically designed for RTLSDR devices.
endef

define Package/dump1090
  $(call Package/dump1090/Default)
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libpthread +librtlsdr
endef

define Package/dump1090/description
  $(call Package/dump1090/Default/description)
endef

TARGET_CFLAGS += $(FPIC)

define Package/dump1090/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/dump1090 $(1)/usr/bin/
endef

$(eval $(call BuildPackage,dump1090))
