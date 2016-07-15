include $(TOPDIR)/rules.mk

PKG_NAME:=uPD72020x-firmware
PKG_RELEASE:=2

RENESAS_FW:=USB3-201-202-FW-20120615
RENESAS_FW_FILE:=$(RENESAS_FW).zip

PKG_SOURCE:=$(PKG_NAME)-$(PKG_RELEASE).tar.gz
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/chunkeey/renesas-fw
PKG_SOURCE_VERSION:=f64132a3bca64b47994fce140c69e2b432751162
PKG_MIRROR_HASH:=427ba5bd64ad8caea983a35046b01dbee6e5f20fea868a163fb97446b4207cef
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_RELEASE)

PKG_FLAGS:=nonshared

include $(INCLUDE_DIR)/package.mk

define Package/uPD72020x-firmware
  SECTION:=firmware
  CATEGORY:=Firmware
  TITLE:=Renesas uPD720201 and uPD720202 firmware
endef

define Package/uPD72020x-firmware/description
  Firmware for the Renesas USB3.0 Host Controllers uPD720201 and uPD720202.
endef

define Build/Compile
	true
endef

define Build/Prepare
	rm -rf $(PKG_BUILD_DIR)
	mkdir -p $(PKG_BUILD_DIR)
	$(TAR) -C $(PKG_BUILD_DIR) -xf $(DL_DIR)/$(PKG_SOURCE)
	unzip -d $(PKG_BUILD_DIR)/ $(PKG_BUILD_DIR)/$(PKG_SOURCE_SUBDIR)/$(RENESAS_FW_FILE)
endef

define Package/uPD72020x-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/$(RENESAS_FW)/K2013080.mem $(1)/lib/firmware/
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/sysloadfw.init $(1)/etc/init.d/sysloadfw
endef

$(eval $(call BuildPackage,uPD72020x-firmware))
