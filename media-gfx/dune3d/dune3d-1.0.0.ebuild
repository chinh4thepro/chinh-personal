# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Dune 3D is a parametric 3D CAD application that supports STEP import/export, fillets and chamfers."
HOMEPAGE="https://github.com/dune3d/dune3d"
SRC_URI="https://github.com/${PN}/${PN}/archive/refs/tags/v${PV}.tar.gz -> dune3d.tar.gz"

LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64"

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

S="${WORKDIR}/${P}"
