# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="set the executable stack flag of ELF binaries and libraries"
HOMEPAGE="https://people.redhat.com/jakub/prelink"
SRC_URI="https://people.redhat.com/jakub/prelink/prelink-20130503.tar.bz2"
RESTRICT="nostrip"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

QA_PREBUILT="*"

S="${WORKDIR}"

src_compile() {
	cd prelink
	
	# fix libelf detection
    	sed -i 's/#include <string.h>/&\n#include <unistd.h>/' m4/libelf.m4
    	
    	autoreconf -fi
    	
    	./configure
    	cd src
    	make execstack
    	
}


src_install() {
	cd prelink/src
	dobin execstack
}
	


