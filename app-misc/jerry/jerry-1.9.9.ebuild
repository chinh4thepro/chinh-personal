# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="watch anime with automatic anilist syncing and other cool stuff"
HOMEPAGE="https://github.com/justchokingaround/jerry"
IUSE="
	info
	manga
	pdf
"

if [[ "${PV}" == *9999* ]]; then
	EGIT_REPO_URI="https://github.com/justchokingaround/${PN}.git"
	inherit git-r3
else
	SRC_URI="
		https://github.com/pystardust/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
		https://github.com/justchokingaround/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	"
	S="${WORKDIR}/${P}"
	KEYWORDS="~amd64"
fi

SLOT="0"

DEPEND="
	media-video/mpv
	app-shells/fzf
	info? ( app-misc/jq )
	manga? ( media-gfx/feh )
	pdf? (
		media-gfx/imagemagick
		app-text/zathura
		app-text/zathura-pdf-poppler
	)
"

RDEPEND="${DEPEND}"

src_install() {
	newbin "${PN}.sh" "${PN}"
}
