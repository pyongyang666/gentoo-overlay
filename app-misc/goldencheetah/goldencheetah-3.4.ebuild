# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit qmake-utils

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
	dev-qt/qtscript:5
	dev-qt/qtserialport:5
	dev-qt/qtsvg:5
	dev-qt/qttranslations:5
	dev-qt/qtbluetooth:5
        sys-libs/zlib"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}-${PV}"

src_prepare() {
	eapply_user

	#eapply "${FILESDIR}"/${P}-flex-fix.patch
	#eapply "${FILESDIR}"/${P}-make_pair-fix.patch

	sed -e "s:#QMAKE_LRELEASE = /usr/bin/lrelease:QMAKE_LRELEASE = /usr/lib64/qt5/bin/lrelease:;s:#QMAKE_CXXFLAGS += -O3:QMAKE_CXXFLAGS += -O3:" src/gcconfig.pri.in > src/gcconfig.pri || die
	#sed -e "s:#QMAKE_LRELEASE = /usr/bin/lrelease:QMAKE_LRELEASE = /usr/lib64/qt5/bin/lrelease:" src/gcconfig.pri.in > src/gcconfig.pri || die
	#sed -e "s:#QMAKE_CXXFLAGS += -O3:QMAKE_CXXFLAGS += -O3:" src/gcconfig.pri > src/gcconfig.pri || die
	#sed -e "s:#QMAKE_LEX = flex:QMAKE_LEX = flex:" src/gcconfig.pri > src/gcconfig.pri || die
	#sed -e "s:#QMAKE_YACC = bison:QMAKE_YACC = bison:" src/gcconfig.pri > src/gcconfig.pri || die
	#sed -e "s:#LIBZ_LIBS    = -lz:LIBZ_LIBS    = -lz:" src/gcconfig.pri > src/gcconfig.pri || die
	sed -e "s:/usr/local/:/usr/:" qwt/qwtconfig.pri.in > qwt/qwtconfig.pri || die
	
	#Force build against QT5.
	export QT_SELECT=5
}

src_configure() {
	eqmake5 -recursive
}

src_install() {
	emake DESTDIR="${D}" INSTALL_ROOT="${D}" install

	dobin "src/GoldenCheetah"
}
