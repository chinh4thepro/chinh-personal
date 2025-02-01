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

IUSE="hyprland i3 mpris pam pipewire +wayland X"

DEPEND="
	dev-cpp/cli11
	dev-libs/jemalloc
	dev-qt/qtbase:6
	dev-qt/qtdeclarative:6
	dev-qt/qtsvg:6
	dev-util/breakpad
	x11-libs/libdrm
	pam? ( sys-libs/pam )
	pipewire? ( media-video/pipewire )
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
		-DDISTRUBUTOR="gentoo overlay (chinh-personal)"
		-DDISTRIBUTOR_DEBUGINFO_AVAILABLE=NO
		-DINSTALL_QML_PREFIX=/lib64/qt6/qml
		-DI3=$(usex i3 OFF ON)
		-DI3_IPC=$(usex i3 OFF ON)
		-DHYPRLAND=$(usex hyprland OFF ON)
		-DHYPRLAND_GLOBAL_SHORTCUTS=$(usex hyprland OFF ON)
		-DHYPRLAND_FOCUS_GRAB=$(usex hyprland OFF ON)
		-DSERVICE_MPRIS=$(usex mpris OFF ON)
		-DSERVICE_PAM=$(usex pam OFF ON)
		-DSERVICE_PIPEWIRE=$(usex pipewire OFF ON)
		-DWAYLAND=$(usex wayland OFF ON)
		-DX11=$(usex X OFF ON)
	)

	cmake_src_configure
}
