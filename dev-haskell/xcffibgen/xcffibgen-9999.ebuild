# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

# ebuild generated by hackport 0.4.4

CABAL_FEATURES="bin lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

MY_PN="xcffib"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A cffi-based python binding for X"
HOMEPAGE="http://github.com/tych0/xcffib"
if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="https://github.com/tych0/xcffib.git"
	inherit git-r3
else
	SRC_URI="mirror://hackage/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="Apache-2.0"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/attoparsec:=[profile?]
	dev-haskell/filemanip:=[profile?]
	>=dev-haskell/language-python-0.5.0:=[profile?]
	>=dev-haskell/mtl-2.1:=[profile?]
	>=dev-haskell/optparse-applicative-0.5:=[profile?]
	dev-haskell/split:=[profile?]
	>=dev-haskell/xcb-types-0.7.0:=[profile?]
	>=dev-lang/ghc-7.6.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.16.0
	test? ( dev-haskell/hunit
		dev-haskell/test-framework
		dev-haskell/test-framework-hunit )
"

if [[ ${PV} != 9999* ]]; then
	S="${WORKDIR}/${MY_P}"
fi

PATCHES=( "${FILESDIR}"/${P}-switch-fix.patch )
#PATCHES=( "${FILESDIR}"/${PN}-setup.hs.patch )
