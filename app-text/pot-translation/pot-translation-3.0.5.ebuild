# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop pax-utils xdg

DESCRIPTION="A cross-platform software for text translation and recognition."
HOMEPAGE="https://github.com/pot-app/pot-desktop"
SRC_URI="https://github.com/pot-app/pot-desktop/archive/refs/tags/${PV}.tar.gz -> pot-translation-${PV}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	net-libs/webkit-gtk:4
	x11-libs/gtk+
	dev-libs/libayatana-appindicator
	x11-misc/xdotool
	x11-libs/libxcb
	x11-libs/libXrandr
	app-text/tesseract
	app-text/tessdata_fast
	net-libs/nodejs
	sys-apps/pnpm
	virtual/rust
	sys-apps/dbus
"
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PREBUILT="*"

S="${WORKDIR}"

src_prepare() {
	eapply_user

	sed -i "s/\"version\".*/\"version\": \"${PV}\"/g" src-tauri/tauri.conf.json || die "Sed failed!"
	pnpm install
}

src_compile() {
	pnpm tauri build -b deb
}

src_install() {
	tar xpf src-tauri/target/release/bundle/deb/pot_${PV}_amd64/data.tar.gz
	dodir /usr
	cp -a usr/* "${ED}"/usr || die
	dobin usr/bin/pot
	doicon -s 32 usr/share/icons/hicolor/32x32/apps/pot.png
	doicon -s 128 usr/share/icons/hicolor/128x128/apps/pot.png
	doicon -s 256 usr/share/icons/hicolor/256x256@2/apps/pot.png
	domenu usr/share/applications/pot.desktop
}

pkg_postinst() {
	xdg_pkg_postinst
}
