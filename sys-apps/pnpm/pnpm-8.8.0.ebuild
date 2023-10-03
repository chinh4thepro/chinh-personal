# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Fast, disk space efficient package manager"
HOMEPAGE="https://pnpm.io/"

SRC_URI="https://github.com/pnpm/pnpm/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="net-libs/nodejs"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-v${PV}"

src_install() {
    local install_dir="/usr/$(get_libdir)/node_modules/pnpm" path shebang
	insinto "${install_dir}"
    doins -r .
    dosym "../$(get_libdir)/node_modules/pnpm/bin/pnpm.cjs" "/usr/bin/pnpm"
    dosym "../$(get_libdir)/node_modules/pnpm/bin/pnpx.cjs" "/usr/bin/pnpx"

	while read -r -d '' path; do
		read -r shebang < "${ED}${path}" || die
		[[ "${shebang}" == \#\!* ]] || continue
		fperms +x "${path}"
	done < <(find "${ED}" -type f -printf '/%P\0' || die)
}
