# Copyright 2010 W-Mark Kubacki, Wais Darwish
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools eutils python

DESCRIPTION="Persistent distributed key-value data caching system."
HOMEPAGE="http://code.google.com/p/redis/"
SRC_URI="http://redis.googlecode.com/files/${PN}-${PV}.tar.gz"

LICENSE="BSD"
KEYWORDS="amd64 x86 >~arm"
IUSE="python"
SLOT="0"

RDEPEND="python? ( >=dev-lang/python-2.5 )"
DEPEND="${RDEPEND}"

pkg_setup() {
	enewgroup redis 75
	enewuser redis 75 -1 -1 redis
}

src_install() {
        insinto /etc/
        doins "${FILESDIR}"/redis.conf
	dosed "s:/var/log/:/var/log/redis/:g" /etc/redis.conf
	fowners redis:redis /etc/redis.conf
	fperms 0644 /etc/redis.conf

	newconfd "${FILESDIR}/redis.confd" redis
        newinitd "${FILESDIR}/redis.initd" redis

	if use python ; then
		insinto $(python_get_sitedir)/redis
                touch "${D}$(python_get_sitedir)/redis/__init__.py"
		doins client-libraries/python/redis.py
	fi

	dodoc 00-RELEASENOTES BETATESTING.txt BUGS COPYING Changelog README TODO
	docinto html
	dodoc doc/*

        dobin redis-benchmark redis-cli
	dosbin redis-server

	diropts -m0750 -o redis -g redis
	dodir /var/lib/redis
	dodir /var/log/redis
}