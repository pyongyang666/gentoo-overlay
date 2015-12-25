# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit qmake-utils autotools-utils

MY_PN="GoldenCheetah"

DESCRIPTION="Cycling performance software"
HOMEPAGE="http://www.goldencheetah.org/"
SRC_URI="https://github.com/GoldenCheetah/${MY_PN}/archive/V${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-qt/qtconcurrent:5
	dev-qt/qtmultimedia:5[widgets]
	dev-qt/qtprintsupport:5
	dev-qt/qtserialport:5
	dev-qt/qtsvg:5
	dev-qt/qttranslations:5"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}"/${P}-flex-fix.patch )

S="${WORKDIR}/${MY_PN}-${PV}"

src_prepare() {
	autotools-utils_src_prepare

	sed -e "s:#QMAKE_LRELEASE:QMAKE_LRELEASE:" src/gcconfig.pri.in > src/gcconfig.pri || die
	sed -e "s:/usr/local/:/usr/:" qwt/qwtconfig.pri.in > qwt/qwtconfig.pri || die
}

src_configure() {
	eqmake5
}

src_install() {
	emake DESTDIR="${D}" INSTALL_ROOT="${D}" install

	dobin "src/GoldenCheetah"
}