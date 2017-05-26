# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="A backport of the subprocess module from Python 3.2/3.3 for use on 2.x"
HOMEPAGE="https://github.com/google/python-subprocess32"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc64 ~x86 ~amd64-linux ~ppc-macos ~x64-macos ~x86-macos"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}"/${P}-sandbox-test-fix.patch )

python_test() {
	python test_subprocess32.py
}
