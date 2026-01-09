build:
	cargo build
	./target/debug/hx

release:
	cargo build --release

install: release
	rm -rf ${exec}/share/helix/helix-workman
	cp -rf ${code}/editor/target/release ${exec}/share/helix/helix-workman
	ln -sf ${exec}/share/helix/helix-workman/hx ${exec}/bin/hx

sysinstall: release
	sudo cp -f /home/slugbyte/workspace/code/editor/target/release/hx /usr/bin/hx
	sudo chmod a+x /usr/bin/hx

grammar:
	hx --grammar fetch
	hx --grammar build
