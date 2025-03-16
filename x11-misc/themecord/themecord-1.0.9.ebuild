# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Discord theme will always match your wallpaper!"
HOMEPAGE="https://github.com/danihek/Themecord"

if [[ ${PV} == 9999 ]]; then
    inherit git-r3
    EGIT_REPO_URI="https://github.com/danihek/Themecord.git"
else
    SRC_URI="https://github.com/danihek/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
    KEYWORDS="amd64"
fi

LICENSE="MIT"
SLOT="0"

src_compile() {
    rm themecord
    ./build-themecord.sh
}

src_install() {
    dobin themecord
}
