# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.4.3

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal git-r3

DESCRIPTION="Parsing and pretty printing of Python code"
HOMEPAGE="http://github.com/bjpop/language-python"
EGIT_REPO_URI="https://github.com/alexbiehl/${PN}.git"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="=dev-haskell/monads-tf-0.1*:=[profile?]
	>=dev-haskell/transformers-0.3:=[profile?] <dev-haskell/transformers-0.5:=[profile?]
	>=dev-lang/ghc-7.6.1:=
"
DEPEND="${RDEPEND}
	dev-haskell/alex
	>=dev-haskell/cabal-1.16.0
	dev-haskell/happy
"