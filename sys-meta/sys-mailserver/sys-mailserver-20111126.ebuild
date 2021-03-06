# Copyright 2006-2011 W-Mark Kubacki
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

DESCRIPTION="Emerge this to obtain packages needed for full featured mailservers."
HOMEPAGE="http://www.ossdl.de/"
RESTRICT="bindist"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 sparc x86"
IUSE=""

RDEPEND="
	sys-auth/pam_pwdfile
	sys-auth/pam_mysql
	sys-meta/sys-mx
	=net-mail/cyrus-imapd-2.3*
	net-mail/cyrus-imap-admin
	net-mail/fetchmail
	dev-libs/cyrus-sasl
	>=mail-mta/postfix-2.8.6
	net-dns/pdns
	net-dns/pdns-recursor
	"
