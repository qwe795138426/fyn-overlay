# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod-r1

COMMIT="21a3fa7ec11a0cbb3be14145f45cdca35c3d3217"

DESCRIPTION="A backport of the Realtek Wifi 5 drivers from the wireless-next repo."
HOMEPAGE="https://github.com/lwfinger/rtw88"

SRC_URI="https://github.com/lwfinger/rtw88/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/rtw88-${COMMIT}"

LICENSE="GPL-2"
SLOT=0
KEYWORDS="~amd64"

MODULES_KERNEL_MIN=6.1

src_compile() {
	local modlist=(
		rtw_8703b=net/wireless/realtek/rtw88
		rtw_8723cs=net/wireless/realtek/rtw88
		rtw_8723de=net/wireless/realtek/rtw88
		rtw_8723d=net/wireless/realtek/rtw88
		rtw_8723ds=net/wireless/realtek/rtw88
		rtw_8723du=net/wireless/realtek/rtw88
		rtw_8723x=net/wireless/realtek/rtw88
		rtw_8812au=net/wireless/realtek/rtw88
		rtw_8814a=net/wireless/realtek/rtw88
		rtw_8814au=net/wireless/realtek/rtw88
		rtw_8821a=net/wireless/realtek/rtw88
		rtw_8821au=net/wireless/realtek/rtw88
		rtw_8821ce=net/wireless/realtek/rtw88
		rtw_8821c=net/wireless/realtek/rtw88
		rtw_8821cs=net/wireless/realtek/rtw88
		rtw_8821cu=net/wireless/realtek/rtw88
		rtw_8822be=net/wireless/realtek/rtw88
		rtw_8822b=net/wireless/realtek/rtw88
		rtw_8822bs=net/wireless/realtek/rtw88
		rtw_8822bu=net/wireless/realtek/rtw88
		rtw_8822ce=net/wireless/realtek/rtw88
		rtw_8822c=net/wireless/realtek/rtw88
		rtw_8822cs=net/wireless/realtek/rtw88
		rtw_8822cu=net/wireless/realtek/rtw88
		rtw_core=net/wireless/realtek/rtw88
		rtw_pci=net/wireless/realtek/rtw88
		rtw_sdio=net/wireless/realtek/rtw88
		rtw_usb=net/wireless/realtek/rtw88
	)
	local modargs=( KSRC="${KV_OUT_DIR}" )

	linux-mod-r1_src_compile
}

src_install() {
	linux-mod-r1_src_install

	insinto /lib/firmware
	doins firmware/*.bin

	insinto /etc/modprobe.d
	doins blacklist-rtw88.conf
}
