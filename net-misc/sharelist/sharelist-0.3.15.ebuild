# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="ShareList 是一个易用的网盘工具，支持快速挂载 GoogleDrive、OneDrive ，可通过插件扩展功能。"
HOMEPAGE="https://github.com/reruin/sharelist"
SRC_URI="https://github.rc1844.workers.dev/reruin/sharelist/releases/download/v${PV}/sharelist_linux_amd64.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

QA_PREBUILT="*"

S="${WORKDIR}"

src_install() {
	insinto "/opt/${PN}"
	doins -r *
	fperms -R +x /opt/${PN}/sharelist
	fperms -R +w /opt/${PN}/
	dosym "../../opt/${PN}/sharelist" "usr/bin/sharelist"
	newinitd "${FILESDIR}/sharelist.init" sharelist
}
	


