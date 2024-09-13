# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm desktop

DESCRIPTION="Motrix is a full-featured download manager"
HOMEPAGE="https://motrix.app/"
SRC_URI="https://github.com/agalwood/Motrix/releases/download/v${PV}/Motrix-${PV}.x86_64.rpm -> motrix-${PV}.rpm"

RESRICT="mirror"
S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	x11-libs/gtk+:3
	x11-libs/libxcb
	"

RDEPEND="${DEPEND}"

BDEPEND=""

QA_PREBUILT="*"

src_unpack() {
	rpm_src_unpack ${A}
}


pkg_nofetch() {
	elog "The following files cannot be fetched for ${P}:"
	einfo "motrix-${PV}.rpm"
	einfo "Please download"
	einfo "from https://github.com/agalwood/Motrix/releases and place them in ${DISTDIR}"
}




src_install() {
	dodir /opt
	cp -a opt/Motrix "${ED}"/opt || die
	dobin opt/Motrix/motrix
	dodir /usr
	cp -a usr/* "${ED}"/usr || die
	local res
	for res in 16 32 256 512; do
		doicon -s ${res} usr/share/icons/hicolor/${res}x${res}/apps/motrix.png
	done

	domenu usr/share/applications/motrix.desktop
}


pkg_postinst() {
	elog "Motrix may need to run with sudo for the first time in Linux"
	elog "because there is no permission to create the download the session"
	elog "file (/var/cache/aria2.session)"
}
