# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

# ebuild generated by hackport 0.2.13

EAPI="3"

CABAL_FEATURES="lib profile haddock hscolour"
inherit haskell-cabal

MY_PN="Decimal"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Decimal numbers with variable precision"
HOMEPAGE="http://hackage.haskell.org/package/decimal"
SRC_URI="http://hackage.haskell.org/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/hunit
		>dev-haskell/quickcheck-2.4
		>=dev-lang/ghc-6.12.3"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-0"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	sed -e 's@base==4@base>=4 \&\& <=5@' \
		-i "${S}/Decimal.cabal" || die "Could not loosen base dependency"
}
