# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# ebuild generated by hackport 0.2.17.9999

EAPI=4

CABAL_FEATURES="lib profile haddock hscolour hoogle"
inherit base haskell-cabal

DESCRIPTION="Probabilistic Functional Programming"
HOMEPAGE="http://www.haskell.org/haskellwiki/Probabilistic_Functional_Programming"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/random-1.0[profile?]
		<dev-haskell/random-2[profile?]
		>=dev-haskell/transformers-0.0.1[profile?]
		<dev-haskell/transformers-0.4[profile?]
		>=dev-haskell/utility-ht-0.0.6[profile?]
		<dev-haskell/utility-ht-0.1[profile?]
		>=dev-lang/ghc-6.8.2"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"

PATCHES=("${FILESDIR}/${PN}-0.2.4-haddock-remove-unicode.patch")