# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Helium (for learning Haskell)"
HOMEPAGE="http://www.cs.uu.nl/helium"
SRC_URI="http://www.cs.uu.nl/helium/distr/${P}-src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
# compilation breaks on amd64, suspect lvm doesn't work properly
KEYWORDS="-amd64 ~ppc -sparc ~x86"
IUSE="readline"

DEPEND=">=virtual/ghc-6.4.2
	readline? ( sys-libs/readline )"
RDEPEND="dev-libs/gmp
	readline? ( sys-libs/readline )"

src_unpack() {
	unpack ${P}-src.tar.gz

	# patch for readline support if requested
	if use readline; then
		epatch "${FILESDIR}/${P}-readline.patch"
	fi
	epatch "${FILESDIR}/${P}-ghc.patch"
}

src_compile() {
	# helium consists of two components that have to be set up separately,
	# lvm and the main compiler. lvm uses a non-standard build system:
	# the ./configure of lvm is not the usual autotools configure

	cd "${S}/lvm/src" && ./configure || die "lvm configure failed"
	cd "${S}/helium" && econf --without-upx --without-ag || die "econf failed"
	cd "${S}/helium/src" && make depend || die "make depend failed"

	if use readline; then
		EXTRA_HC_OPTS="${EXTRA_HC_OPTS} -package readline"
	fi
	emake -j1 EXTRA_HC_OPTS="${EXTRA_HC_OPTS}" \
		|| die "make failed" # emake doesn't work safely
}

src_install() {
	cd helium/src || die "cannot cd to helium/src"
	make \
		prefix="${D}/usr" \
		bindir="${D}/usr/lib/helium/bin" \
		libdir="${D}/usr/lib/helium/lib" \
		demodir="${D}/usr/lib/helium/demo" \
		install || die "make failed"

	# create wrappers
	newbin "${FILESDIR}/helium-wrapper-${PV}" helium-wrapper

	dosym /usr/bin/helium-wrapper /usr/bin/texthint
	dosym /usr/bin/helium-wrapper /usr/bin/helium
	dosym /usr/bin/helium-wrapper /usr/bin/lvmrun
}
