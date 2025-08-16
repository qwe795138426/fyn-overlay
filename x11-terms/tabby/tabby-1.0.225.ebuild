# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm desktop

DESCRIPTION="Tabby (formerly Terminus) is a highly configurable terminal emulator"
HOMEPAGE="https://github.com/Eugeny/tabby"
SRC_URI="https://github.com/Eugeny/tabby/releases/download/v${PV}/tabby-${PV}-linux-x64.rpm"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
RESRICT="mirror"
S="${WORKDIR}"


QA_PREBUILT="*"

src_unpack() {
	rpm_src_unpack ${A}
}


pkg_nofetch() {
	elog "The following files cannot be fetched for ${P}:"
	einfo "tabby-${PV}-linux.rpm"
	einfo "Please download"
	einfo "from https://github.com/Eugeny/tabby/releases and place them in ${DISTDIR}"
}

src_install() {
	dodir /opt
	cp -a opt/Tabby "${ED}"/opt || die
	dobin opt/Tabby/tabby
	dodir /usr
	cp -a usr/* "${ED}"/usr || die
	local res
	for res in 16 32 256 512; do
		doicon -s ${res} usr/share/icons/hicolor/${res}x${res}/apps/tabby.png
	done

	domenu usr/share/applications/tabby.desktop
}
