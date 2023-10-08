EAPI=8

inherit meson vala xdg

DESCRIPTION="Parental control for applications"
HOMEPAGE="https://gitlab.freedesktop.org/pwithnall/malcontent"

SRC_URI="https://gitlab.freedesktop.org/pwithnall/malcontent/-/archive/${PV}/${PN}-${PV}.tar.gz"

KEYWORDS="~amd64"
LICENSE="GPL-2"
SLOT="0"
IUSE="gtk-doc"

# Build deps taken from arch pkgbuild. Might change later
DEPEND="
	sys-apps/accountsservice
    dev-python/pygobject
    sys-apps/dbus
    sys-apps/flatpak
    dev-libs/glib
    gui-libs/gtk
    x11-libs/gtk+:3
    gui-libs/libadwaita
    sys-auth/polkit
    dev-libs/appstream
"

BDEPEND="
	dev-util/meson
	dev-vcs/git
    dev-libs/gobject-introspection
    gtk-doc? ( dev-util/gtk-doc )
    app-text/yelp-tools
    dev-libs/libglib-testing
    $(vala_depend)
"
src_prepare() {
    default
    vala_setup
}
