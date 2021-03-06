# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

# ebuild generated by hackport 0.2.13

EAPI="3"

CABAL_FEATURES="bin"
inherit haskell-cabal

DESCRIPTION="A pie chart image generator for the hledger accounting tool."
HOMEPAGE="http://hledger.org"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6
		>=dev-haskell/chart-0.11
		=dev-haskell/cmdargs-0.9*
		dev-haskell/colour
		~dev-haskell/hledger-0.16.1
		~dev-haskell/hledger-lib-0.16.1
		dev-haskell/hunit
		>=dev-haskell/safe-0.2
		dev-haskell/time
		>=dev-lang/ghc-6.8.2"

src_prepare() {
	sed -e 's@cmdargs >= 0.8   && < 0.9@cmdargs >= 0.8   \&\& < 0.10@g' \
		-i "${S}/${PN}.cabal" || die "Could not loosen dependencies"
}
