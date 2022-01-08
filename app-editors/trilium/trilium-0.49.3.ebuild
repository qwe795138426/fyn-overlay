# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop pax-utils xdg

DESCRIPTION="Trilium Notes is a hierarchical note taking application with focus on building large personal knowledge bases."
HOMEPAGE="https://github.com/zadam/trilium"
SRC_URI="https://fyn-github-mirror.qwe7951384261.workers.dev/https://github.com/zadam/trilium/releases/download/v${PV}/trilium-linux-x64-${PV}.tar.xz"

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

S="${WORKDIR}/trilium-linux-x64"

src_install() {
	pax-mark m trilium
	insinto "/opt/${PN}"
	doins -r *
	fperms 4711 /opt/${PN}/chrome-sandbox
	fperms 755 /opt/${PN}/*.sh
	fperms -R +x /opt/${PN}/trilium
	dosym "../../opt/${PN}/trilium" "usr/bin/trilium"
	domenu "${FILESDIR}/trilium.desktop"
	newicon "icon.png" "trilium.png"
}

pkg_postinst() {
	xdg_pkg_postinst
}
