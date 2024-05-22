# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/marcof-nikogo/${PN}.git"
fi

DESCRIPTION="An advanced window decoration plugin for the wayfire window manager."
HOMEPAGE="https://github.com/marcof-nikogo/wf-external-decoration"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="
	<=gui-libs/wayfire-plugins-extra-0.8.0
	<=gui-wm/wayfire-0.8.0-r2
	x11-libs/gtk+:3
"
BDEPEND="
	dev-build/meson
	dev-build/ninja
"
