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

define Package/jx_jthread
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:= jx jthread(version 1.3.1)
  DEPENDS:=+libstdcpp
endef

define Package/jx_jthread/description

endef


define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include

	chmod 0755 $(PKG_INSTALL_DIR)/usr/lib32/libjthread.{a,so.*}

	$(CP) $(PKG_INSTALL_DIR)/usr/include/jthread $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib32/libjthread.{a,so*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib32/pkgconfig/jthread.pc $(1)/usr/lib/pkgconfig/


endef

define Package/jx_jthread/install
	$(INSTALL_DIR) $(1)/usr/lib

	chmod 0755 $(PKG_INSTALL_DIR)/usr/lib32/libjthread.{a,so.*}

	$(CP) $(PKG_INSTALL_DIR)/usr/lib32/libjthread.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/jthread $(TOOLCHAIN_DIR)/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib32/libjthread.{a,so*} $(TOOLCHAIN_DIR)/lib/
endef

$(eval $(call BuildPackage,jx_jthread))

