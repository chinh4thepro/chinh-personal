EAPI=8

inherit cmake

DESCRIPTION="The hyprland cursor format, library, and utilities"
HOMEPAGE="https://github.com/hyprwm/hyprcursor"
SRC_URI="https://github.com/hyprwm/hyprcursor/archive/refs/tags/v${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# Note: Adjust the dependency versions according to what's available in Gentoo.
# Add git to DEPEND as it's listed in makedepends in the PKGBUILD.
DEPEND="
    >=dev-libs/hyprlang-0.4.2
    x11-libs/cairo
    dev-libs/libzip
    gnome-base/librsvg
    dev-vcs/git
    dev-build/cmake
    sys-devel/gcc
    dev-debug/gdb
"
RDEPEND="${DEPEND}"

src_configure() {
    local mycmakeargs=(
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=/usr
    )
    cmake_src_configure
}

src_install() {
    cmake_src_install

    # Install LICENSE file
    insinto /usr/share/licenses/${PN}
    doins LICENSE
}
