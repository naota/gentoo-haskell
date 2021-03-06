# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

# ebuild generated by hackport 0.2.13

EAPI="3"

CABAL_FEATURES="lib profile haddock hscolour"
inherit haskell-cabal

DESCRIPTION="CSS parser and renderer."
HOMEPAGE="http://www.yesodweb.com/"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="<dev-haskell/attoparsec-text-0.9
		=dev-haskell/text-0.11*
		>=dev-lang/ghc-6.10.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8
		test? ( dev-haskell/hunit
			=dev-haskell/hspec-0.9*
			dev-haskell/quickcheck
		)
		"

src_prepare() {
	sed -e 's@hspec                     >= 0.6.1    && < 0.7@hspec                     >= 0.6.1    \&\& < 0.10@' \
		-i "${S}/${PN}.cabal" || die "Could not loosen dependencies"
}

src_configure() {
	cabal_src_configure $(use_enable test tests)
}
