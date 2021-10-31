# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Motrix is a full-featured download manager"
HOMEPAGE="https://motrix.app/"
SRC_URI="https://github.rc1844.workers.dev/qwe795138426/fyn-mirror/blob/main/www-client/motrix/motrix-1.6.11.tar.xz -> motrix-1.6.11.tar.xz"

RESRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	x11-libs/gtk+:3
	x11-libs/libxcb
	"

RDEPEND="${DEPEND}"

BDEPEND=""

pkg_nofetch() {
	elog "The following files cannot be fetched for ${P}:"
	einfo "motrix-1.6.11.tar.gz"
	einfo "Please download"
	einfo "from https://github.com/agalwood/Motrix/releases and place them in ${DISTDIR}"
}


src_unpack() {
	if [[ -n ${A} ]]; then
		unpack ${A}
	fi
}
src_compile() {
	ture
}

src_install() {
	cp -rf ./* /opt/motrix
	ls /opt/motrix/motrix /usr/bin/motrix
}

pkg_postinst() {
	elog "Motrix may need to run with sudo for the first time in Linux"
	elog "because there is no permission to create the download the session"
	elog "file (/var/cache/aria2.session)"
}
