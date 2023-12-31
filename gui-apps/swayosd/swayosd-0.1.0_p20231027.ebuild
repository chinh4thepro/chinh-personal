# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_COMMIT="1c7d2f5b3ee262f25bdd3c899eadf17efb656d26"
MY_PN="SwayOSD"

CRATES="
	aho-corasick@1.0.2
	anyhow@1.0.71
	async-broadcast@0.5.1
	async-channel@1.9.0
	async-executor@1.5.1
	async-fs@1.6.0
	async-global-executor@2.3.1
	async-io@1.13.0
	async-lock@2.7.0
	async-process@1.7.0
	async-recursion@1.0.4
	async-std@1.12.0
	async-task@4.4.0
	async-trait@0.1.71
	atk-sys@0.17.0
	atk@0.17.1
	atomic-waker@1.1.1
	autocfg@1.1.0
	bitflags@1.3.2
	bitflags@2.3.3
	blight@0.7.0
	block-buffer@0.10.4
	blocking@1.3.1
	bumpalo@3.13.0
	byteorder@1.4.3
	cairo-rs@0.17.10
	cairo-sys-rs@0.17.10
	cascade@1.0.1
	cc@1.0.79
	cfg-expr@0.15.3
	cfg-if@1.0.0
	colored@2.0.4
	concurrent-queue@2.2.0
	cpufeatures@0.2.9
	crossbeam-utils@0.8.16
	crypto-common@0.1.6
	derivative@2.2.0
	digest@0.10.7
	either@1.8.1
	enumflags2@0.7.7
	enumflags2_derive@0.7.7
	equivalent@1.0.1
	errno-dragonfly@0.1.2
	errno@0.3.1
	evdev-rs@0.6.1
	evdev-sys@0.2.5
	event-listener@2.5.3
	fastrand@1.9.0
	field-offset@0.3.6
	fs4@0.6.6
	futures-channel@0.3.28
	futures-core@0.3.28
	futures-executor@0.3.28
	futures-io@0.3.28
	futures-lite@1.13.0
	futures-macro@0.3.28
	futures-sink@0.3.28
	futures-task@0.3.28
	futures-util@0.3.28
	gdk-pixbuf-sys@0.17.10
	gdk-pixbuf@0.17.10
	gdk-sys@0.17.0
	gdk@0.17.1
	generic-array@0.14.7
	getrandom@0.2.10
	gio-sys@0.17.10
	gio@0.17.10
	glib-macros@0.17.10
	glib-sys@0.17.10
	glib@0.17.10
	gloo-timers@0.2.6
	gobject-sys@0.17.10
	gtk-layer-shell-sys@0.6.0
	gtk-layer-shell@0.6.1
	gtk-sys@0.17.0
	gtk3-macros@0.17.1
	gtk@0.17.1
	hashbrown@0.14.0
	heck@0.4.1
	hermit-abi@0.3.2
	hex@0.4.3
	indexmap@2.0.0
	input-sys@1.17.0
	input@0.8.3
	instant@0.1.12
	io-lifetimes@1.0.11
	is-terminal@0.4.9
	itertools@0.8.2
	js-sys@0.3.64
	kv-log-macro@1.0.7
	lazy_static@1.4.0
	libc@0.2.147
	libpulse-binding@2.27.1
	libpulse-sys@1.20.1
	libudev-sys@0.1.4
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.3
	log@0.4.19
	memchr@2.5.0
	memoffset@0.7.1
	memoffset@0.9.0
	nix@0.26.2
	num-derive@0.3.3
	num-traits@0.2.15
	once_cell@1.18.0
	ordered-stream@0.2.0
	pango-sys@0.17.10
	pango@0.17.10
	parking@2.1.0
	pin-project-lite@0.2.10
	pin-utils@0.1.0
	pkg-config@0.3.27
	polling@2.8.0
	ppv-lite86@0.2.17
	proc-macro-crate@1.3.1
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro2@1.0.64
	pulsectl-rs@0.3.2
	quote@1.0.29
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	redox_syscall@0.3.5
	regex-automata@0.3.2
	regex-syntax@0.7.4
	regex@1.9.1
	rustc_version@0.4.0
	rustix@0.37.23
	rustix@0.38.4
	semver@1.0.17
	serde@1.0.171
	serde_derive@1.0.171
	serde_repr@0.1.14
	serde_spanned@0.6.3
	sha1@0.10.5
	shrinkwraprs@0.3.0
	signal-hook-registry@1.4.1
	signal-hook@0.3.15
	slab@0.4.8
	smallvec@1.11.0
	socket2@0.4.9
	static_assertions@1.1.0
	substring@1.4.5
	syn@1.0.109
	syn@2.0.25
	system-deps@6.1.1
	target-lexicon@0.12.9
	tempfile@3.6.0
	thiserror-impl@1.0.43
	thiserror@1.0.43
	toml@0.7.6
	toml_datetime@0.6.3
	toml_edit@0.19.12
	tracing-attributes@0.1.26
	tracing-core@0.1.31
	tracing@0.1.37
	typenum@1.16.0
	udev@0.7.0
	uds_windows@1.0.2
	unicode-ident@1.0.10
	value-bag@1.4.1
	version-compare@0.1.1
	version_check@0.9.4
	waker-fn@1.1.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.87
	wasm-bindgen-futures@0.4.37
	wasm-bindgen-macro-support@0.2.87
	wasm-bindgen-macro@0.2.87
	wasm-bindgen-shared@0.2.87
	wasm-bindgen@0.2.87
	web-sys@0.3.64
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-targets@0.48.1
	windows_aarch64_gnullvm@0.48.0
	windows_aarch64_msvc@0.48.0
	windows_i686_gnu@0.48.0
	windows_i686_msvc@0.48.0
	windows_x86_64_gnu@0.48.0
	windows_x86_64_gnullvm@0.48.0
	windows_x86_64_msvc@0.48.0
	winnow@0.4.9
	xdg-home@1.0.0
	zbus@3.14.1
	zbus_macros@3.14.1
	zbus_names@2.6.0
	zvariant@3.15.0
	zvariant_derive@3.15.0
	zvariant_utils@1.0.1
"

inherit cargo

DESCRIPTION="A GTK based on screen display for keyboard shortcuts like caps-lock and volume"
HOMEPAGE="https://github.com/ErikReider/SwayOSD/"
SRC_URI="
	https://github.com/ErikReider/SwayOSD/archive/${MY_COMMIT}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"
S="${WORKDIR}/${MY_PN}-${MY_COMMIT}"

LICENSE="GPL-3+"
LICENSE+="
	Apache-2.0-with-LLVM-exceptions
	BSD
	GPL-3+
	MIT
	MPL-2.0
	Unicode-DFS-2016
"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
    media-libs/libpulse
    dev-libs/libinput
    gui-libs/gtk
    gui-libs/gtk-layer-shell
"
BDEPEND="
    dev-lang/rust
    dev-vcs/git
    dev-util/meson
    dev-util/ninja
"
