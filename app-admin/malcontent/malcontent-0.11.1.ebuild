EAPI=8

inherit meson udev systemd pam

DESCRIPTION="Parental controll for applications"
HOMEPAGE="https://gitlab.freedesktop.org/pwithnall/malcontent"

SRC_URI="https://gitlab.freedesktop.org/pwithnall/malcontent/-/archive/${PV}/${PN}-${PV}.tar.gz"

KEYWORDS="~amd64"
LICENSE="GPL-2"
SLOT="0"

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
    dev-util/gtk-doc
    app-text/yelp-tools
    dev-libs/libglib-testing
"

S="${WORKDIR}/${PN}-${PV}"

src_prepare() {
	default
}

src_configure() {
	meson_src_configure
}

src_install() {
	meson_src_install
}
