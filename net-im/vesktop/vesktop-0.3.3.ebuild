# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit chromium-2 desktop linux-info optfeature unpacker xdg

DESCRIPTION="A cross platform electron-based desktop app aiming to give you a snappier Discord experience with Vencord pre-installed"
HOMEPAGE="https://github.com/Vencord/Vesktop/"
SRC_URI="https://github.com/Vencord/Vesktop/releases/download/v${PV}/VencordDesktop-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="bindist mirror strip test"
IUSE="notifications +xdg"

DEPEND="
	notifications? ( x11-libs/libnotify )
	xdg? ( x11-misc/xdg-utils )
"

BDEPEND="
	sys-apps/yarn
	dev-vcs/git
"

DESTDIR="/opt/${PN}"

QA_PREBUILT="*"

S="${WORKDIR}/Vesktop-${PV}"

src_unpack() {
	unpack ${P}.tar.gz
}

src_configure() {
	default
	chromium_suid_sandbox_check_kernel_config
}


src_install() {
	exeinto "${DESTDIR}"

	doexe vencorddesktop chrome-sandbox libEGL.so libffmpeg.so libGLESv2.so libvk_swiftshader.so

	insinto "${DESTDIR}"
	doins chrome_100_percent.pak chrome_200_percent.pak icudtl.dat resources.pak snapshot_blob.bin v8_context_snapshot.bin
	insopts -m0755
	doins -r locales resources

	fowners root "${DESTDIR}/chrome-sandbox"
	fperms 4711 "${DESTDIR}/chrome-sandbox"

	[[ -x chrome_crashpad_handler ]] && doins chrome_crashpad_handler

	dosym "${DESTDIR}/vencorddesktop" "/usr/bin/vencorddesktop"

}

pkg_postinst() {
	xdg_pkg_postinst
}
