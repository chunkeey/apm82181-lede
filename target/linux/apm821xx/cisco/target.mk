#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

BOARDNAME:=Cisco Meraki
FEATURES += ramdisk nand pcie squashfs

define Target/Description
	Build firmware images for Cisco Meraki APs with the APM821XX SoC.
endef
