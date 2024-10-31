# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop pax-utils xdg

DESCRIPTION="Build your personal knowledge base with TriliumNext Notes "
HOMEPAGE="https://github.com/TriliumNext/Notes"
SRC_URI="https://github.com/TriliumNext/Notes/releases/download/v0.90.8/TriliumNextNotes-v${PV}-linux-x64.zip"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	x11-libs/gtk+:3
	dev-libs/nss
"
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PREBUILT="*"

S="${WORKDIR}/TriliumNext Notes-linux-x64"

src_unpack() {
	unpack TriliumNextNotes-v${PV}-linux-x64.zip
}

src_install() {
	pax-mark m trilium
	insinto "/opt/${PN}"
	doins -r *
	fperms 4711 /opt/${PN}/chrome-sandbox
	fperms -R +x /opt/${PN}/trilium
	dosym "../../opt/${PN}/trilium" "usr/bin/trilium"
	domenu "${FILESDIR}/trilium.desktop"
	newicon "icon.png" "trilium.png"
}

pkg_postinst() {
	xdg_pkg_postinst
}
