include $(TOPDIR)/rules.mk

PKG_NAME:=libevent2
PKG_VERSION:=2.1.8
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/libevent-$(PKG_VERSION)-stable
PKG_SOURCE:=libevent-$(PKG_VERSION)-stable.tar.gz
PKG_SOURCE_URL:= \
	https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/
PKG_HASH:=965cc5a8bb46ce4199a47e9b2c9e1cae3b137e8356ffdad6d94d3b9069b71dc2
PKG_MAINTAINER:=Jo-Philipp Wich <jo@mein.io>
PKG_LICENSE:=BSD-3-Clause
PKG_CPE_ID:=cpe:/a:libevent_project:libevent

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/jx_libevent2/Default
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Event notification
  URL:=https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/
endef

define Package/jx_libevent2/Default/description
	The libevent API provides a mechanism to execute a callback function
	when a specific event occurs on a file descriptor or after a timeout
	has been reached. Furthermore, libevent also support callbacks due
	to signals or regular timeouts.

	libevent is meant to replace the event loop found in event driven
	network servers. An application just needs to call event_dispatch()
	and then add or remove events dynamically without having to change
	the event loop.
endef

define Package/jx_libevent2
  $(call Package/jx_libevent2/Default)
  TITLE+= library (changed by jx version 2.1)
endef

define Package/jx_libevent2/description
	$(call Package/jx_libevent2/Default/description)

	This package contains the libevent shared library historically
	containing both the core & extra libraries.
endef

define Package/jx_libevent2-core
  $(call Package/jx_libevent2/Default)
  TITLE+= core library (changed by jx version 2.1)
endef

define Package/jx_libevent2-core/description
	$(call Package/jx_libevent2/Default/description)

	This package contains the libevent core shared library for the event,
	buffer & utility functions.
endef

define Package/jx_libevent2-extra
  $(call Package/jx_libevent2/Default)
  TITLE+= extra library (changed by jx version 2.1)
endef

define Package/jx_libevent2-extra/description
	$(call Package/jx_libevent2/Default/description)

	This package contains the libevent extra shared library for specific
	protocols including HTTP, DNS & RPC.
endef

define Package/jx_libevent2-openssl
  $(call Package/jx_libevent2/Default)
  TITLE+= OpenSSL library (changed by jx version 2.1)
  DEPENDS+=+libopenssl
endef

define Package/jx_libevent2-openssl/description
	$(call Package/jx_libevent2/Default/description)

	This package contains the libevent OpenSSL shared library for encrypted
	bufferevents.
endef

define Package/jx_libevent2-pthreads
  $(call Package/jx_libevent2/Default)
  TITLE+= Pthreads library (changed by jx version 2.1)
  DEPENDS+=+libpthread
endef

define Package/jx_libevent2-pthreads/description
	$(call Package/jx_libevent2/Default/description)

	This package contains the libevent Pthreads shared library for
	threading & locking.
endef

TARGET_CFLAGS += $(FPIC)

CONFIGURE_ARGS += \
	--enable-shared \
	--enable-static \
	--disable-debug-mode \
	--disable-openssl

MAKE_FLAGS += \
	CFLAGS="$(TARGET_CFLAGS)"

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevent*.{la,a,so} $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevent*-2.1.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/libevent*.pc $(1)/usr/lib/pkgconfig/
endef

define Package/jx_libevent2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevent-2.1.so* $(1)/usr/lib/

	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(TOOLCHAIN_DIR)/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevent*-2.1.so* $(TOOLCHAIN_DIR)/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevent*.{la,a,so} $(TOOLCHAIN_DIR)/lib/

endef

define Package/jx_libevent2-core/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevent_core-2.1.so* $(1)/usr/lib/
endef

define Package/jx_libevent2-extra/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevent_extra-2.1.so* $(1)/usr/lib/
endef

define Package/jx_libevent2-openssl/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevent_openssl-2.1.so* $(1)/usr/lib/
endef

define Package/jx_libevent2-pthreads/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libevent_pthreads-2.1.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,jx_libevent2))
$(eval $(call BuildPackage,jx_libevent2-core))
$(eval $(call BuildPackage,jx_libevent2-extra))
$(eval $(call BuildPackage,jx_libevent2-openssl))
$(eval $(call BuildPackage,jx_libevent2-pthreads))
