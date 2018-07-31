include $(TOPDIR)/rules.mk

PKG_NAME:=jxlibjsoncpp
PKG_VERSION:=1.8.0
PKG_RELEASE:=1


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/jx_jsoncpp
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=jx jsoncpp(version 1.8.0)
  DEPENDS:=+libstdcpp +alsa-lib
endef

define Package/jx_jsoncpp/description

endef

define Build/Prepare
	tar zxvf jsoncpp-1.8.0.tar.gz
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./jsoncpp-1.8.0/* $(PKG_BUILD_DIR)/
	rm -rf jsoncpp-1.8.0
endef

CMAKE_OPTIONS+= \
	-DCMAKE_BUILD_TYPE=release \
	-DJSONCPP_WITH_TESTS=OFF \
	-DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF \
	-DBUILD_STATIC_LIBS=ON \
	-DBUILD_SHARED_LIBS=ON


define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/json $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libjsoncpp.{a,so*} $(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/jsoncpp.pc $(1)/usr/lib/pkgconfig/
endef

define Package/jx_jsoncpp/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libjsoncpp.so* $(1)/usr/lib/

	$(CP) $(PKG_INSTALL_DIR)/usr/include/json $(TOOLCHAIN_DIR)/include/

	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libjsoncpp.{a,so*} $(TOOLCHAIN_DIR)/lib/

endef

$(eval $(call BuildPackage,jx_jsoncpp))
