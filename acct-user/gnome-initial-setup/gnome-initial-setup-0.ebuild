# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="User for gnome-initial-setup"
ACCT_USER_ID=102
ACCT_USER_GROUPS=( gnome-initial-setup )

acct-user_add_deps
