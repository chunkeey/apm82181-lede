include $(TOPDIR)/rules.mk

PKG_NAME:=renesas-fw
PKG_VERSION:=2016-06-04
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/renesas-fw
  SECTION:=boot
  CATEGORY:=Boot Loaders
  DEPENDS:=@TARGET_apm821xx
  TITLE:=renesas_fw
  DEFAULT:=y if TARGET_WNDR4700
endef

define Package/renesas-fw/description
  Firmware for the Renesas uPD720201 and uPD720202.
endef

define Build/Compile
	true
endef

define Package/renesas-fw/install
	$(INSTALL_DIR) $(1)/lib/firmware/
	$(INSTALL_DATA) K2013080.mem $(1)/lib/firmware/
endef

$(eval $(call BuildPackage,renesas-fw))
