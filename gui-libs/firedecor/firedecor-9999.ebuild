# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/AhoyISki/${PN}.git"
fi

DESCRIPTION="An advanced window decoration plugin for the wayfire window manager. "
HOMEPAGE="https://github.com/AhoyISki/firedecor"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

DEPEND="
	gui-wm/wayfire
	gnome-base/librsvg
	dev-libs/boost
"
BDEPEND="
	dev-build/meson
"
