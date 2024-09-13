# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop pax-utils xdg

DESCRIPTION="A cross-platform software for text translation and recognition."
HOMEPAGE="https://github.com/pot-app/pot-desktop"
SRC_URI="https://github.com/pot-app/pot-desktop/releases/download/3.0.5/pot_3.0.5_amd64.deb"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	net-libs/webkit-gtk
	gui-libs/gtk
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
	unpack ${A}
	unpack ${WORKDIR}/data.tar.gz
}

src_install() {
	dodir /usr
	cp -a usr/* "${ED}"/usr || die
	dobin usr/bin/pot
	local res
	for res in 32 128 do
		doicon -s ${res} usr/share/icons/hicolor/${res}x${res}/apps/pot.png
	done
	doicon -s 256 usr/share/icons/hicolor/256x256@2/apps/pot.png
	domenu usr/share/applications/pot.desktop
}

pkg_postinst() {
	xdg_pkg_postinst
}
