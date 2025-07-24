# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm

DESCRIPTION="Motrix is a full-featured download manager"
HOMEPAGE="https://motrix.app/"
SRC_URI="https://file.starvpn.cn/stars/releases/rpm/${PV}/starvpn-${PV}-amd64.rpm -> starvpn-${PV}.rpm"

RESRICT="mirror"
S="${WORKDIR}"

LICENSE="STARVPN-EULA"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	"

RDEPEND="${DEPEND}"

BDEPEND=""

QA_PREBUILT="*"

src_unpack() {
	rpm_src_unpack ${A}
}

src_install() {
	dodir /opt/stars
	chmod -R 754 usr/local/lib/stars
	cp -a usr/local/lib/stars/* "${ED}"/opt/stars || die
	dobin /opt/stars/stars
	
}



