# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV="v${PV}-beta"

inherit meson

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Aylur/${PN}.git"
else
	SRC_URI="https://github.com/Aylur/${PN}/archive/refs/rags/${MY_PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}-${PV}"
fi

DESCRIPTION="Aylurs's Gtk Shell (AGS), An eww inspired gtk widget system."
HOMEPAGE="https://github.com/Alyur/ags"

LICENSE="GPL-3"
SLOT="0"
IUSE="upower bluetooth networkmanager tray"

DEPEND="
	dev-lang/typescript
	dev-libs/gjs
	gui-libs/gtk
	gui-libs/gtk-layer-shell
	dev-libs/gobject-introspection
	upower? ( sys-power/upower )
	bluetooth? ( net-wireless/gnome-bluetooth )
	networkmanager? ( net-misc/networkmanager )
	tray? ( dev-libs/libdbusmenu )
"
BDEPEND="
	$DEPEND
	dev-util/meson
	net-libs/nodejs[npm]
"
RDEPEND="
	$DEPEND
"

src_configure() {
	npm install
	meson_src_configure
}

src_install() {
	meson_src_install
	elog "ags wont run without a config file (usually in ~/.config/ags)."
	elog "For example configs visit https://github.com/Aylur/ags/wiki"
}
