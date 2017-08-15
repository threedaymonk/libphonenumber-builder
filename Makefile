SHELL = /bin/sh

vendor/closure-compiler/closure-compiler.jar :
	curl 'http://dl.google.com/closure-compiler/compiler-latest.tar.gz' | \
		tar -C $(@D) --gunzip --extract --verbose \
		&& mv $(@D)/$$(ls $(@D) | grep jar) $@
