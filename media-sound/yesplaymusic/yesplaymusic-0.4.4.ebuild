# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm desktop

DESCRIPTION="High-quality third-party NetEase cloud player"
HOMEPAGE="https://music.qier222.com/"
SRC_URI="https://github.rc1844.workers.dev/qier222/YesPlayMusic/releases/download/v${PV}/yesplaymusic-${PV}.x86_64.rpm -> yesplaymusic-${PV}.rpm"

RESRICT="mirror"
S="${WORKDIR}"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/nss
	x11-libs/gtk+:3"
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PREBUILT="*"

src_unpack() {
	rpm_src_unpack ${A}
}

src_install() {
	dodir /opt
	cp -a opt/YesPlayMusic "${ED}"/opt || die
	dobin opt/YesPlayMusic/yesplaymusic
	dodir /usr
	cp -a usr/* "${ED}"/usr || die
	local res
	for res in 16 32 256 512; do
        doicon -s ${res} usr/share/icons/hicolor/${res}x${res}/apps/yesplaymusic.png
    done

	domenu usr/share/applications/yesplaymusic.desktop
}

