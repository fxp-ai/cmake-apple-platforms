.PHONY: all clean

all:
	@sh scripts/build.sh

clean:
	@rm -rf _build _install

