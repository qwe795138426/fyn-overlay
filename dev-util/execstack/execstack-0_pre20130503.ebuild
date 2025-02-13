# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="set the executable stack flag of ELF binaries and libraries"
HOMEPAGE="https://people.redhat.com/jakub/prelink"
SRC_URI="https://people.redhat.com/jakub/prelink/prelink-20130503.tar.bz2"

S="${WORKDIR}"/prelink

LICENSE="GPL-1+"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	default
	eautoreconf
}

src_compile() {
	cd prelink
	# fix libelf detection
	sed -i 's/#include <string.h>/&\n#include <unistd.h>/' m4/libelf.m4 || die
	autoreconf -fi || die
	cd src
	make execstack || die
}

src_install() {
	dobin prelink/src/execstack
}
