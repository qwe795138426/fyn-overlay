# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop pax-utils xdg

DESCRIPTION="A cross-platform software for text translation and recognition.(Appimage version)"
HOMEPAGE="https://github.com/pot-app/pot-desktop"
SRC_URI="https://github.com/pot-app/pot-desktop/releases/download/${PV}/pot_${PV}_amd64.AppImage -> pot-translation-${PV}.AppImage"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	sys-fs/fuse:0
"
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PREBUILT="*"

S="${WORKDIR}"

src_unpack() {
	true
}

src_install() {
	dodir /opt/pot-desktop
	cp ${DISTDIR}/pot-translation-${PV}.AppImage "${ED}"/opt/pot-desktop/pot || die
	chmod +x "${ED}"/opt/pot-desktop/pot
	ln -s "${ED}"/opt/pot-desktop/pot "${ED}"/opt/bin/pot
	doicon -s 32 ${FILESDIR}/icons/hicolor/32x32/apps/pot.png
	doicon -s 128 ${FILESDIR}/icons/hicolor/128x128/apps/pot.png
	doicon -s 256 ${FILESDIR}/icons/hicolor/256x256@2/apps/pot.png
	domenu ${FILESDIR}/pot.desktop
	dostrip -x /opt/pot-desktop/pot
}

pkg_postinst() {
	xdg_pkg_postinst
}
