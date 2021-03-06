# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

CABAL_FEATURES="lib profile haddock hscolour"
inherit haskell-cabal

DESCRIPTION="Memory mapped files for POSIX and Windows"
HOMEPAGE="http://hackage.haskell.org/package/mmap"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="test"

DEPEND=">=dev-lang/ghc-6.8
		>=dev-haskell/cabal-1.2
		test? ( dev-haskell/hunit )"

src_compile() {
	if use test; then
		# enable building tests
		CABAL_CONFIGURE_FLAGS="--flags=mmaptest"
	fi

	cabal_src_compile
}

src_test() {
	# breaking the abstraction a bit, we're not supposed to know about ./setup
	# and how it works...
	./dist/build/mmaptest/mmaptest || die "tests failed"
}

src_install() {
	cabal_src_install

	rm "${D}/usr/bin/mmaptest"
	rmdir "${D}/usr/bin" 2> /dev/null # only if empty
}
