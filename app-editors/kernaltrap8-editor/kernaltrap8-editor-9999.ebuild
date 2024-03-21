EAPI=8

inherit meson

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/kernaltrap8/editor"
	S="${WORKDIR}/${PN}-9999"
fi

DESCRIPTION="Simple CLI text editor in C"
HOMEPAGE="https://github.com/kernaltrap8/editor"

LICENSE="GPL-3"
SLOT="0"

DEPEND="${BDEPEND}"
BDEPEND="
	dev-build/meson
"
