include $(TOPDIR)/rules.mk

PKG_NAME:=libexosip2
PKG_VERSION:=5.0.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:= \
	http://www.antisip.com/download/exosip2/
PKG_HASH:=a26558594de95405d3adeee554a7c10cb3ec5a9316a879e679b53a99a9cf2e1f

PKG_MAINTAINER:=Jo-Philipp Wich <jo@mein.io>

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1
PKG_LICENSE:=LGPL-2.1+

include $(INCLUDE_DIR)/package.mk

define Package/jx_exosip2
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=jx exosip2(version 5.0.0)
  DEPENDS:= +jx_osip2
endef

define Package/jx_exosip2/description
endef


CONFIGURE_ARGS+= \
	--enable-shared \
	--disable-static \
	--disable-trace \
	--enable-pthread=force \
	--disable-openssl

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/eXosip2 $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libeXosip2.so* $(1)/usr/lib/
endef

define Package/jx_exosip2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libeXosip2.so* $(1)/usr/lib/

	$(CP) $(PKG_INSTALL_DIR)/usr/include/eXosip2 $(TOOLCHAIN_DIR)/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libeXosip2.so* $(TOOLCHAIN_DIR)/lib/

endef
$(eval $(call BuildPackage,jx_exosip2))
