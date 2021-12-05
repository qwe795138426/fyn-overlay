# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="An open source note taking and to-do application(Appimage version)"

HOMEPAGE="https://joplinapp.org"

SRC_URI="https://github.com/laurent22/joplin/releases/download/v${PV}/Joplin-${PV}.AppImage -> Joplin-${PV}.AppImage"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="x11-themes/hicolor-icon-theme"
RDEPEND="${DEPEND}"

QA_PREBUILT="*"

S="${WORKDIR}"

src_unpack() {
	return
}

src_configure() {
	chmod +x Joplin-${PV}.AppImage
}

src_install() {
	insinto "/opt/Joplin"
	newins "Joplin-${PV}.AppImage" "Joplin.AppImage"
	newicon "${FILESDIR}/joplin.png" "joplin.png"
	domenu "${FILESDIR}/appimagekit-joplin.desktop"
}
