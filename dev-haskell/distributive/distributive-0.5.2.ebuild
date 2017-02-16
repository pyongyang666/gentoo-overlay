# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

# ebuild generated by hackport 0.5.1

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Distributive functors -- Dual to Traversable"
HOMEPAGE="https://github.com/ekmett/distributive/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="+semigroups +tagged"

RDEPEND=">=dev-haskell/base-orphans-0.5:=[profile?] <dev-haskell/base-orphans-1:=[profile?]
	>=dev-haskell/transformers-compat-0.3:=[profile?] <dev-haskell/transformers-compat-1:=[profile?]
	>=dev-lang/ghc-7.8.2:=
	semigroups? ( >=dev-haskell/semigroups-0.11:=[profile?] <dev-haskell/semigroups-1:=[profile?] )
	tagged? ( >=dev-haskell/tagged-0.7:=[profile?] <dev-haskell/tagged-1:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
	>=dev-haskell/cabal-doctest-1 <dev-haskell/cabal-doctest-1.1
	test? ( >=dev-haskell/doctest-0.11.1 <dev-haskell/doctest-0.12
		>=dev-haskell/generic-deriving-1.11 <dev-haskell/generic-deriving-2
		>=dev-haskell/hspec-2 <dev-haskell/hspec-3 )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag semigroups semigroups) \
		$(cabal_flag tagged tagged)
}
