# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Fast, disk space efficient package manager"
HOMEPAGE="https://pnpm.io/"

SRC_URI="https://github.com/pnpm/pnpm/releases/download/v${PV}/pnpm-linux-x64"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="strip"

RDEPEND="net-libs/nodejs"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

QA_FLAGS_IGNORED="/usr/bin/${PN}"

src_install() {
	newbin "${DISTDIR}/pnpm-linux-x64" ${PN}
}

