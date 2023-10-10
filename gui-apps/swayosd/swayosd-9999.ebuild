# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson ninja-utils cargo

DESCRIPTION="A GTK based on screen display for keyboard shortcuts like caps-lock and volume"
HOMEPAGE="https://github.com/ErikReider/SwayOSD"

LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ErikReider/SwayOSD.git"
fi

DEPEND="
	gui-libs/gtk-layer-shell
	gui-libs/gtk
	dev-libs/libinput
	media-sound/pulseaudio
"
BDEPEND="
	dev-vcs/git
	dev-util/meson
	dev-util/ninja
	dev-lang/rust
"
