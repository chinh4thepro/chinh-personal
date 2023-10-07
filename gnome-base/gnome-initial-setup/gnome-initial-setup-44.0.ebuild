EAPI=8

inherit meson desktop readme.gentoo-r1 udev systemd pam

DESCRIPTION="Gnome initial setup"
HOMEPAGE="https://gitlab.gnome.org/GNOME/gnome-initial-setup"

SRC_URI="https://github.com/GNOME/gnome-initial-setup/archive/refs/tags/${PV}.tar.gz"

KEYWORDS="~amd64"
LICENSE="GPL-2"
SLOT="0"

DEPEND="
	sys-apps/accountsservice
	x11-libs/cairo
	media-libs/fontconfig
	x11-libs/gdk-pixbuf
	gnome-base/gdm
	app-misc/geoclue
	dev-libs/glib
	gnome-base/gnome-desktop
	gnome-base/gnome-control-center
	gnome-base/gnome-keyring
	gnome-base/gsettings-desktop-schemas
	gui-libs/gtk
	dev-libs/json-glib
	app-crypt/mit-krb5
	gui-libs/libadwaita
	gnome-base/libgnomekbd
	dev-libs/libgweather
	app-i18n/ibus
	net-libs/libnma
	dev-libs/libpwquality
	net-libs/rest
	app-crypt/libsecret
	x11-libs/pango
	sys-auth/polkit
	net-libs/webkit-gtk
    app-admin/malcontent
"

BDEPEND="
	dev-util/meson
	dev-vcs/git"

src_prepare() {
	default
	xdg_en

}

src_configure() {
	local emesonargs=(
		-Ddesktop_docs=true
		$(meson_feature X wayland)
		$(meson_feature udev)
		$(meson_use debug debug_tools)
		$(meson_use gtk-doc gtk_doc)
		$(meson_feature systemd)
		-Dinstalled_tests=false
		-Dbuild_gtk4=true
		-Dlegacy_library=false
		-Dintrospection=true
	)

	meson_src_configure
}

src_install() {
	meson_src_install
}


# Still need to set up users and groups
