# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 optfeature

DESCRIPTION="16 colors fork of pywal"
HOMEPAGE="https://github.com/eylles/pywal16/"

if [[ ${PV} == 9999 ]]; then
    inherit git-r3
    EGIT_REPO_URI="https://github.com/eylles/pywal16.git"
else
    SRC_URI="https://github.com/eylles/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
    KEYWORDS="amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="media-gfx/imagemagick[jpeg]"

pkg_postinst() {
    optfeature "setting wallpaper support" \
		media-gfx/feh \
		x11-misc/hsetroot \
		x11-misc/nitrogen
}
