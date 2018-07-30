#
# Copyright (C) 2011-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=jthread
PKG_VERSION:=1.3.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:= \
        http://research.edm.uhasselt.be/jori/jthread/
PKG_HASH:=faefdaf0465bc459629e7569c5b37c08bd7fe7c061449f44d2a776cc1d892b50

PKG_MAINTAINER:=Jo-Philipp Wich <jo@mein.io>

PKG_LICENSE:=LGPL-2.1+

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/jxlibjthread
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=jxlibjthread
  DEPENDS:=+libstdcpp
endef

define Package/jxlibjthread/description
  defined by jx
endef


define Build/InstallDev
        $(INSTALL_DIR) $(1)/usr/include
        $(CP) $(PKG_INSTALL_DIR)/usr/include/jthread $(1)/usr/include/
        $(INSTALL_DIR) $(1)/usr/lib
        $(CP) $(PKG_INSTALL_DIR)/usr/lib32/libjthread.{a,so*} $(1)/usr/lib/
        $(INSTALL_DIR) $(1)/usr/lib/pkgconfig
        $(CP) $(PKG_INSTALL_DIR)/usr/lib32/pkgconfig/jthread.pc $(1)/usr/lib/pkgconfig/


endef

define Package/jxlibjthread/install
        $(INSTALL_DIR) $(1)/usr/lib
        $(CP) $(PKG_INSTALL_DIR)/usr/lib32/libjthread.so* $(1)/usr/lib/

        $(CP) $(PKG_INSTALL_DIR)/usr/include/jthread $(TOOLCHAIN_DIR)/include/
        $(CP) $(PKG_INSTALL_DIR)/usr/lib32/libjthread.{a,so*} $(TOOLCHAIN_DIR)/lib/
endef

$(eval $(call BuildPackage,jxlibjthread))
