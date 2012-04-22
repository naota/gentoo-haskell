# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# ebuild generated by hackport 0.2.17.9999

EAPI=4

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Privacy Enhanced Mail (PEM) format reader and writer."
HOMEPAGE="http://github.com/vincenthz/hs-pem"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/attoparsec[profile?]
		dev-haskell/base64-bytestring[profile?]
		dev-haskell/cereal[profile?]
		dev-haskell/mtl[profile?]
		>=dev-lang/ghc-6.8.2"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8
		test? ( >=dev-haskell/quickcheck-2.4.0.1
			>=dev-haskell/test-framework-0.3.3
			<dev-haskell/test-framework-0.7
			>=dev-haskell/test-framework-quickcheck2-0.2.9
			<dev-haskell/test-framework-quickcheck2-0.3
		)"

src_prepare() {
	sed -e 's@test-framework >= 0.3.3 && < 0.6@test-framework >= 0.3.3 \&\& < 0.7@' \
		-i "${S}/${PN}.cabal" || die "Could not loosen dependencies"
	# upstream forgot the tests
	cp -pR "${FILESDIR}/${PN}-0.1.0/Tests" "${S}/Tests" \
		|| die "Could not copy missing test source files"
}