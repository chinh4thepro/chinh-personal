# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Flexbile QtQuick based desktop shell toolkit."
HOMEPAGE="https://git.outfoxxed.me/quickshell/quickshell/"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.outfoxxed.me/quickshell/quickshell.git"
else
	SRC_URI=""
	KEYWORDS="~amd64"
	S="${WORKDIR}/${P}"
fi

LICENSE="LGPL-3"
SLOT="0"

IUSE="hyprland +jemalloc pam pipewire +qtsvg +wayland X"

DEPEND="
	dev-cpp/cli11
	dev-qt/qtbase:6
	dev-qt/qtdeclarative:6
	dev-util/breakpad
	x11-libs/libdrm
	jemalloc? ( dev-libs/jemalloc )
	pam? ( sys-libs/pam )
	pipewire? ( media-video/pipewire )
	qtsvg? ( dev-qt/qtsvg:6 )
	wayland? (
		dev-libs/wayland
		dev-libs/wayland-protocols
		dev-qt/qtwayland:6
		dev-util/wayland-scanner
	)
	X? ( x11-libs/libxcb )
"

BDEPEND="
	dev-build/cmake
	dev-build/ninja
	dev-qt/qtshadertools
	dev-util/spirv-tools
	virtual/pkgconfig
"

src_configure() {
	local mycmakeargs=(
		-DDISTRIBUTOR="gentoo overlay (chinh-personal)"
		-DDISTRIBUTOR_DEBUGINFO_AVAILABLE=NO
		-DINSTALL_QML_PREFIX=/lib64/qt6/qml
		-DUSE_JEMALLOC=$(usex jemalloc ON OFF)
		-DHYPRLAND=$(usex hyprland ON OFF)
		-DHYPRLAND_GLOBAL_SHORTCUTS=$(usex hyprland ON OFF)
		-DHYPRLAND_FOCUS_GRAB=$(usex hyprland ON OFF)
		-DSERVICE_PAM=$(usex pam ON OFF)
		-DSERVICE_PIPEWIRE=$(usex pipewire ON OFF)
		-DWAYLAND=$(usex wayland ON OFF)
		-DX11=$(usex X ON OFF)
	)

	cmake_src_configure
}
