# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop pax-utils xdg rpm

DESCRIPTION="A cross-platform software for text translation and recognition"
HOMEPAGE="https://github.com/pot-app/pot-desktop"
SRC_URI="https://github.com/pot-app/pot-desktop/releases/download/${PV}/pot-${PV}-1.x86_64.rpm -> pot-translation-${PV}-1.rpm"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	sys-fs/fuse:0
	net-libs/webkit-gtk:4
	dev-libs/libayatana-appindicator
	x11-misc/xdotool
	x11-libs/libxcb
	x11-libs/libXrandr
	app-text/tesseract
	app-text/tessdata_fast
	
"
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PREBUILT="*"

S="${WORKDIR}"

src_unpack() {
	rpm_src_unpack ${A}
}

src_install() {
	dodir /opt/pot-desktop
	cp -a usr/bin/pot "${ED}"/opt/pot-desktop || die
	dobin usr/bin/pot
	dodir /usr
	cp -a usr/* "${ED}"/usr || die
	local res
	for res in  32 128; do
		doicon -s ${res} usr/share/icons/hicolor/${res}x${res}/apps/pot.png
	done
	doicon -s 256 usr/share/icons/hicolor/256x256@2/apps/pot.png
	domenu usr/share/applications/pot.desktop
}

pkg_postinst() {
	xdg_pkg_postinst
}
