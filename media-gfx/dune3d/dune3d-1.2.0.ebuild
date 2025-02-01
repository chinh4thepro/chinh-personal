# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="A parametric 3D CAD application."
HOMEPAGE="https://github.com/dune3d/dune3d"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dune3d/dune3d.git"
else
	SRC_URI="https://github.com/${PN}/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${P}"
fi

LICENSE="GPL-3"

SLOT="0"

RDEPEND="
	dev-cpp/cairomm
	dev-cpp/gtkmm:4.0
	dev-libs/libspnav
	sci-libs/opencascade
	sys-apps/util-linux
"

DEPEND="${RDEPEND}"

BDEPEND="
    dev-build/cmake
    dev-build/meson
    dev-cpp/eigen
    dev-python/pygobject
    dev-python/pycairo
    gnome-base/librsvg
    media-libs/glm
    virtual/pkgconfig
"
