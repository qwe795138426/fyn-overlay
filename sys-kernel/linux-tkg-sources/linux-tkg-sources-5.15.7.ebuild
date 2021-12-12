# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
ETYPE="sources"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="2"
K_SECURITY_UNSUPPORTED="1"
K_NOSETEXTRAVERSION="1"
PRJC_R=1

inherit kernel-2 optfeature
detect_version
detect_arch

# major kernel version, e.g. 5.14
SHPV="${KV_MAJOR}.${KV_MINOR}"

KEYWORDS="~amd64"

IUSE+="bmq pds bcachefs"
DESCRIPTION="the Linux Kernel with a selection of patches aiming for better desktop/gaming experience and Gentoo's genpatches"
HOMEPAGE="https://github.rc1844.workers.dev/Frogging-Family/linux-tkg"

SRC_URI="${KERNEL_URI}
		https://dev.gentoo.org/~mpagano/genpatches/tarballs/genpatches-${SHPV}-${K_GENPATCHES_VER}.base.tar.xz
		https://dev.gentoo.org/~mpagano/genpatches/tarballs/genpatches-${SHPV}-${K_GENPATCHES_VER}.extras.tar.xz
		https://github.rc1844.workers.dev/Frogging-Family/linux-tkg/raw/master/linux-tkg-patches/${SHPV}/0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch -> 0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by-${PV}.patch
		https://github.rc1844.workers.dev/Frogging-Family/linux-tkg/raw/master/linux-tkg-patches/${SHPV}/0001-mm-Support-soft-dirty-flag-reset-for-VA-range.patch -> 0001-mm-Support-soft-dirty-flag-reset-for-VA-range-${PV}.patch
		https://github.rc1844.workers.dev/Frogging-Family/linux-tkg/raw/master/linux-tkg-patches/${SHPV}/0002-clear-patches.patch -> 0002-clear-patches-${PV}.patch
		https://github.rc1844.workers.dev/Frogging-Family/linux-tkg/raw/master/linux-tkg-patches/${SHPV}/0002-mm-Support-soft-dirty-flag-read-with-reset.patch -> 0002-mm-Support-soft-dirty-flag-read-with-reset-${PV}.patch
		https://github.rc1844.workers.dev/Frogging-Family/linux-tkg/raw/master/linux-tkg-patches/${SHPV}/0003-glitched-base.patch -> 0003-glitched-base-${PV}.patch
		https://github.rc1844.workers.dev/Frogging-Family/linux-tkg/raw/master/linux-tkg-patches/${SHPV}/0003-glitched-cfs-additions.patch -> 0003-glitched-cfs-additions-${PV}.patch
		https://github.rc1844.workers.dev/Frogging-Family/linux-tkg/raw/master/linux-tkg-patches/${SHPV}/0003-glitched-cfs.patch -> 0003-glitched-cfs-${PV}.patch
		https://github.rc1844.workers.dev/Frogging-Family/linux-tkg/raw/master/linux-tkg-patches/${SHPV}/0005-glitched-pds.patch -> 0005-glitched-pds-${PV}.patch
		https://github.rc1844.workers.dev/Frogging-Family/linux-tkg/raw/master/linux-tkg-patches/${SHPV}/0006-add-acs-overrides_iommu.patch -> 0006-add-acs-overrides_iommu-${PV}.patch
		https://github.rc1844.workers.dev/Frogging-Family/linux-tkg/raw/master/linux-tkg-patches/${SHPV}/0007-v${SHPV}-fsync.patch -> 0007-v${SHPV}-fsync-${PV}.patch
		https://github.rc1844.workers.dev/Frogging-Family/linux-tkg/raw/master/linux-tkg-patches/${SHPV}/0007-v${SHPV}-futex_waitv.patch -> 0007-v${SHPV}-futex_waitv-${PV}.patch
		https://github.rc1844.workers.dev/Frogging-Family/linux-tkg/raw/master/linux-tkg-patches/${SHPV}/0007-v${SHPV}-fsync1_via_futex_waitv.patch -> 0007-v${SHPV}-fsync1_via_futex_waitv-${PV}.patch
		https://github.rc1844.workers.dev/Frogging-Family/linux-tkg/raw/master/linux-tkg-patches/${SHPV}/0007-v${SHPV}-winesync.patch -> 0007-v${SHPV}-winesync-${PV}.patch
		https://github.rc1844.workers.dev/Frogging-Family/linux-tkg/raw/master/linux-tkg-patches/${SHPV}/0008-${SHPV}-bcachefs.patch -> 0008-${SHPV}-bcachefs-${PV}.patch
		https://github.rc1844.workers.dev/Frogging-Family/linux-tkg/raw/master/linux-tkg-patches/${SHPV}/0009-glitched-bmq.patch -> 0009-glitched-bmq-${PV}.patch
		https://github.rc1844.workers.dev/Frogging-Family/linux-tkg/raw/master/linux-tkg-patches/${SHPV}/0009-glitched-ondemand-bmq.patch -> 0009-glitched-ondemand-bmq-${PV}.patch
		https://github.rc1844.workers.dev/Frogging-Family/linux-tkg/raw/master/linux-tkg-patches/${SHPV}/0009-prjc_v${SHPV}-r${PRJC_R}.patch -> 0009-prjc_v${SHPV}-r${PRJC_R}-${PV}.patch
"

PATCHES=( "${DISTDIR}/0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by-${PV}.patch"
		"${DISTDIR}/0001-mm-Support-soft-dirty-flag-reset-for-VA-range-${PV}.patch"
		"${DISTDIR}/0002-clear-patches-${PV}.patch"
		"${DISTDIR}/0002-mm-Support-soft-dirty-flag-read-with-reset-${PV}.patch"
		"${DISTDIR}/0003-glitched-base-${PV}.patch"
		"${DISTDIR}/0003-glitched-cfs-additions-${PV}.patch"
		"${DISTDIR}/0003-glitched-cfs-${PV}.patch"
		"${DISTDIR}/0006-add-acs-overrides_iommu-${PV}.patch"
		"${DISTDIR}/0007-v${SHPV}-fsync-${PV}.patch"
		#"${DISTDIR}/0007-v${SHPV}-fsync1_via_futex_waitv-${PV}.patch"
		#"${DISTDIR}/0007-v${SHPV}-futex_waitv-${PV}.patch"
		"${DISTDIR}/0007-v${SHPV}-winesync-${PV}.patch"
		"${DISTDIR}/0009-prjc_v${SHPV}-r${PRJC_R}-${PV}.patch")


pkg_setup() {
	ewarn ""
	ewarn "${PN} is *not* supported by the Gentoo Kernel Project in any way."
	ewarn "If you need support, please contact the pf developers directly."
	ewarn "Do *not* open bugs in Gentoo's bugzilla unless you have issues with"
	ewarn "the ebuilds. Thank you."
	ewarn ""
	if use bmq; then
		PATCHES=(${PATCHES} 
				"${DISTDIR}/0009-glitched-bmq-${PV}.patch"
				"${DISTDIR}/0009-glitched-ondemand-bmq-${PV}.patch")
	fi
	if use pds; then
		PATCHES=(${PATCHES} 
				"${DISTDIR}/0005-glitched-pds-${PV}.patch")
	fi
	if use bcachefs; then
		PATCHES=(${PATCHES} 
				"${DISTDIR}/0008-${SHPV}-bcachefs-${PV}.patch")
	fi
	kernel-2_pkg_setup
}

src_prepare() {
	# kernel-2_src_prepare doesn't apply PATCHES().
	default
}

pkg_postinst() {
	kernel-2_pkg_postinst
}
