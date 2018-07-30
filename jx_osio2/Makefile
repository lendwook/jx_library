include $(TOPDIR)/rules.mk

PKG_NAME:=libosip2
PKG_VERSION:=5.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:= \
	http://www.antisip.com/download/exosip2/
PKG_HASH:=18a13c954f7297978e7bf1a0cdadde7c531e519d61a045dae304e054f3b2df03

PKG_MAINTAINER:=Jo-Philipp Wich <jo@mein.io>

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1
PKG_LICENSE:=LGPL-2.1+

include $(INCLUDE_DIR)/package.mk

define Package/jx_osip2
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=jx osip2(version 5.0.0)
endef

define Package/jx_osip2/description
endef

CONFIGURE_ARGS+= \
	--enable-shared \
	--enable-static \
	--disable-trace \
	--enable-pthread=force \
	--enable-semaphore

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/osip2 $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/osipparser2 $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libosip2.{a,la,so*} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libosipparser2.{a,la,so*} $(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libosip2.pc $(1)/usr/lib/pkgconfig/
endef

define Package/jx_osip2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libosip2.so* $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libosipparser2.so* $(1)/usr/lib/

	$(CP) $(PKG_INSTALL_DIR)/usr/include/osip2 $(TOOLCHAIN_DIR)/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/include/osipparser2 $(TOOLCHAIN_DIR)/include/

	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libosip2.{a,la,so*} $(TOOLCHAIN_DIR)/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libosipparser2.{a,la,so*} $(TOOLCHAIN_DIR)/lib/

endef

$(eval $(call BuildPackage,jx_osip2))
