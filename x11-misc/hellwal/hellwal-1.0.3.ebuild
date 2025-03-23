# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Pywal-like color palette generator, but faster and in C"
HOMEPAGE="https://github.com/danihek/hellwal"

if [[ ${PV} == 9999 ]]; then
    inherit git-r3
    EGIT_REPO_URI="https://github.com/danihek/hellwal"
else
    SRC_URI="https://github.com/danihek/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
    KEYWORDS="amd64"
fi

LICENSE="MIT"
SLOT="0"

src_install() {
	dobin hellwal
}
