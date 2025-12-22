build:
	cargo build
	./target/debug/hx

install:
	cargo build --release
	rm -rf ${exec}/share/helix/helix-custom
	cp -r ${code}/helix-workman/target/release ${exec}/share/helix/helix-custom

grammar:
	hx --grammar fetch
	hx --grammar build
