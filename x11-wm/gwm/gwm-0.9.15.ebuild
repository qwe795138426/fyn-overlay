# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="X11 window manager written with XLIB + C"
HOMEPAGE="https://sourceforge.net/projects/gsmwm/"
SRC_URI="https://master.dl.sourceforge.net/project/gsmwm/${P}.tar.gz?viasf=1 -> ${P}.tar.gz"


LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="acpi xsetroot dmenu"
DEPEND="
	x11-base/xorg-server
	acpi? (
		sys-power/acpi
	)
	xsetroot? (
		x11-apps/xsetroot
	)
	dmenu? (
	x11-misc/dmenu
	)
"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/ctags"

src_configure() {
	make
}

pkg_postinst() {
	elog "This project is still in development"
	elog "if you have any problem, please comment it in ${HOMEPAGE}"
}
