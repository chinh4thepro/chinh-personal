# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vala desktop gnome2 meson pam readme.gentoo-r1 systemd udev

DESCRIPTION="Helps you to set up your OS whenn you boot for the first time"
HOMEPAGE="https://gitlab.gnome.org/GNOME/gnome-initial-setup"

SRC_URI="https://github.com/GNOME/gnome-initial-setup/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-2+"
SLOT="44"
KEYWORDS="~amd64"

RDEPEND="
	sys-apps/accountsservice
	x11-libs/cairo
	media-libs/fontconfig
	x11-libs/gdk-pixbuf
	gnome-base/gdm
	app-misc/geoclue
	sci-geosciences/geocode-glib
	dev-libs/glib
	gnome-base/gnome-desktop
	gnome-base/gnome-control-center
	gnome-base/gnome-keyring
	net-libs/gnome-online-accounts
	gnome-base/gsettings-desktop-schemas
	gui-libs/gtk
	dev-libs/json-glib
	app-crypt/mit-krb5
	gui-libs/libadwaita
	gnome-base/libgnomekbd
	dev-libs/libgweather
	app-i18n/ibus
	app-admin/malcontent
	net-libs/libnma
	dev-libs/libpwquality
	net-libs/rest
	app-crypt/libsecret
	x11-libs/pango
	sys-auth/polkit
	net-libs/webkit-gtk
"

DEPEND="${RDEPEND}"

BDEPEND="
	$(vala_depend)
	dev-util/meson
	dev-vcs/git
"


src_prepare() {
	default
	vala_setup
}

src_configure() {
	local emesonargs=(
	      --localstatedir /var
	)

	meson_src_configure
}

pkg_postinst() {
    gnome2_pkg_postinst
    udev_reload
}

pkg_postrm() {
    udev_reload
}
