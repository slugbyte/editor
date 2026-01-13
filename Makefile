DATE := $(shell date +%Y%m%d-%H%M%S)
INSTALL_DIR_SYSTEM := /usr/bin
INSTALL_PATH_SYSTEM := ${INSTALL_DIR_SYSTEM}/e

INSTALL_DIR_USER := ${user}/share/slugbyte/build/editor
INSTALL_PATH_USER := ${INSTALL_DIR_USER}/${DATE}-e
LINK_PATH_USER := ${user}/bin/e

build:
	mkdir -p ${INSTALL_DIR_USER}
	cargo build
	cp target/debug/e ${INSTALL_PATH_USER}-debug
	ln -sf ${INSTALL_PATH_USER}-debug ${user}/bin/e-debug

release:
	cargo build --release
	
# install a dated release build into $user/share/slugbyte/build/editor
# make a link to the new release in $user/bin
# make a backup of the previoush release link called e-last
install-user: release
	mkdir -p ${INSTALL_DIR_USER}
	cp target/release/e ${INSTALL_PATH_USER}
	[ -f ${LINK_PATH_USER} ] && mv --force ${LINK_PATH_USER} ${LINK_PATH_USER}-last || true
	ln -sf ${INSTALL_PATH_USER} ${LINK_PATH_USER}

# install a relase build into /usr/bin
install-sys: release
	sudo cp -f target/release/e ${INSTALL_PATH_SYSTEM}
	sudo chmod a+x ${INSTALL_PATH_SYSTEM}

install: install-user install-sys

grammar:
	hx --grammar fetch
	hx --grammar build
