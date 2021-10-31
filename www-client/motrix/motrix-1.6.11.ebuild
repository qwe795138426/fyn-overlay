# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Motrix is a full-featured download manager that supports downloading HTTP, FTP, BitTorrent, Magnet, etc."
HOMEPAGE="https://motrix.app/"
SRC_URI="https://github.com/agalwood/Motrix/archive/refs/tags/v1.6.11.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-apps/yarn
net-libs/nodejs
net-misc/curl
x11-libs/gtk+:3
x11-libs/libxcb"
RDEPEND="${DEPEND}"
BDEPEND=""

pkg_nofetch() {
	elog "The following files cannot be fetched for ${P}:"
	einfo "v.1.6.11.tar.bz2"
	einfo "Please download"
	einfo "from https://github.com/agalwood/Motrix/releases and place them in ${DISTDIR}"
}

pkg_setup() {
	curl https://myip.ipip.net | grep -i "中国"
	if [ $? -eq 0 ]
	then
		echo "Yes,I'm sure you are in China."
		echo "To speed up installation I'll change npm mirrors to Taobao."
		npm config set registry 'https://registry.npm.taobao.org'
		export ELECTRON_MIRROR='https://npm.taobao.org/mirrors/electron/'
		export SASS_BINARY_SITE='https://npm.taobao.org/mirrors/node-sass'
	else
		curl https://myip.ipip.net | grep -i "China"
		if [ $? -eq 0 ]
		then
			echo "Yes,I'm sure you are in China."
			echo "To speed up installation I'll change npm mirrors to Taobao."
                	npm config set registry 'https://registry.npm.taobao.org'
                	export ELECTRON_MIRROR='https://npm.taobao.org/mirrors/electron/'
                	export SASS_BINARY_SITE='https://npm.taobao.org/mirrors/node-sass'
		fi
	fi
}


src_compile() {
	yarn && npm run build:dir
}

src_install() {
	cp -rf release/linux-unpacked /opt/Motrix
}

pkg_postinst() {
	elog "Motrix may need to run with sudo for the first time in Linux"
	elog "because there is no permission to create the download the session"
	elog "file (/var/cache/aria2.session)"
release/linux-unpacked}
