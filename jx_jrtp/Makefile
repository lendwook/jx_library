include $(TOPDIR)/rules.mk

PKG_NAME:=jrtplib
PKG_VERSION:=3.10.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:= \
	http://research.edm.uhasselt.be/jori/jrtplib/
PKG_HASH:=3b2896a8246abe570dc5b60f8501fad9d5aa874430fb7d49dac0e04d1734a1cb

PKG_MAINTAINER:=Jo-Philipp Wich <jo@mein.io>

PKG_LICENSE:=LGPL-2.1+

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/jx_jrtp
  SECTION:=libs
  CATEGORY:=Libraries
  DEPENDS:=+jx_jthread
  TITLE:=jx jrtp(version 3.10.0)
endef

define Package/jx_jrtp/description

endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/jrtplib3 $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	
	chmod 0755 $(PKG_INSTALL_DIR)/usr/lib32/libjrtp.{a,so.*}

	$(CP) $(PKG_INSTALL_DIR)/usr/lib32/libjrtp.{a,so*} $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib32/pkgconfig/jrtplib.pc $(1)/usr/lib/pkgconfig/
endef

define Package/jx_jrtp/install
	$(INSTALL_DIR) $(1)/usr/lib

	chmod 0755 $(PKG_INSTALL_DIR)/usr/lib32/libjrtp.{a,so.*}

	$(CP) $(PKG_INSTALL_DIR)/usr/lib32/libjrtp.so* $(1)/usr/lib/

	$(CP) $(PKG_INSTALL_DIR)/usr/include/jrtplib3 $(TOOLCHAIN_DIR)/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib32/libjrtp.{a,so*} $(TOOLCHAIN_DIR)/lib/
endef

$(eval $(call BuildPackage,jx_jrtp))
