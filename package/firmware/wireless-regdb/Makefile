include $(TOPDIR)/rules.mk

PKG_NAME:=wireless-regdb
PKG_VERSION:=2018-10-24

PKG_SOURCE:=$(PKG_NAME)-master-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/wireless-regdb.git/snapshot/
PKG_HASH:=6737a742cbd4c9740171a537faff0b3ec2813632d74efb09bccfe39e605d7fb6

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-master-$(PKG_VERSION)

PKG_MAINTAINER:=Felix Fietkau <nbd@nbd.name>

include $(INCLUDE_DIR)/package.mk

define Package/wireless-regdb
	SECTION:=firmware
	CATEGORY:=Firmware
	URL:=https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/wireless-regdb.git/
	TITLE:=Wireless Regulatory Database
endef

define Build/Compile
	python $(PKG_BUILD_DIR)/db2fw.py $(PKG_BUILD_DIR)/regulatory.db $(PKG_BUILD_DIR)/db.txt
endef

define Package/wireless-regdb/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(CP) $(PKG_BUILD_DIR)/regulatory.db $(1)/lib/firmware/
endef

$(eval $(call BuildPackage,wireless-regdb))
