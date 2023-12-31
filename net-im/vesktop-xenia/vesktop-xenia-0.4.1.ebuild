# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PS="VencordDesktop-${PV}"
MY_PN="vesktop"
# A bit hacky lol
FILESDIR="/var/tmp/portage/net-im/${P}/files"

CHROMIUM_LANGS="
	af am ar bg bn ca cs da de el en-GB en-US es es-419 et fa fi fil fr gu he hi
	hr hu id it ja kn ko lt lv ml mr ms nb nl pl pt-BR pt-PT ro ru sk sl sr sv
	sw ta te th tr uk ur vi zh-CN zh-TW
"

inherit chromium-2 desktop linux-info optfeature unpacker xdg

DESCRIPTION="A cross platform electron-based desktop app aiming to give you a snappier Discord experience with Vencord pre-installed"
HOMEPAGE="https://github.com/Vencord/Vesktop/"
SRC_URI="https://github.com/Vencord/Vesktop/releases/download/v${PV}/${MY_PS}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="bindist mirror strip test"
IUSE="notifications +xdg"

DEPEND="
	notifications? ( x11-libs/libnotify )
	xdg? ( x11-misc/xdg-utils )
"

BDEPEND="
	dev-vcs/git
"

DESTDIR="/usr/${MY_PN}"

QA_PREBUILT="*"

CONFIG_CHECK="~USER_NS"

S="${WORKDIR}/${MY_PS}"

src_unpack() {
	unpack ${MY_PS}.tar.gz
}

src_configure() {
	default
	chromium_suid_sandbox_check_kernel_config
}


src_install() {
	doicon -s 256 "${FILESDIR}/vencorddesktop.png"

	# install .desktop file
	domenu "${FILESDIR}/vencorddesktop.desktop"

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
