# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit optfeature

DESCRIPTION="Community-maintained extensions for hyprland"
HOMEPAGE="https://hyprland.org/"
if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/hyprwm/contrib.git"
	inherit git-r3
else
	SRC_URI="https://github.com/hyprwm/contrib/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

S="${WORKDIR}/contrib-${PV}"

LICENSE="MIT"
SLOT="0"

RDEPEND="
		gui-apps/wl-clipboard
		gui-apps/grim
		app-misc/jq
		gui-apps/slurp
		app-misc/jq
		gui-apps/hyprpicker
"
BDEPEND="
		app-text/scdoc
"
DEPEND="${RDEPEND}"

src_install() {
	   pushd grimblast || die
	   PREFIX="${D}/usr" emake install
	   popd || die
}

pkg_postinst() {
		optfeature "GUI notifications during dependency checks" x11-libs/libnotify
}
