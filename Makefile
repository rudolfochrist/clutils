.PHONY: docs clean

clean:
	rm -rf include/ clutils.texinfo

clutils.texinfo: *.lisp *.asd
	sbcl --quit --no-userinit \
	--eval '(require :asdf)' \
	--eval '(pushnew (truename ".") asdf:*central-registry*)' \
	--eval '(pushnew (truename "~/quicklisp/local-projects/sb-texinfo/") asdf:*central-registry*)' \
	--eval '(require :sb-texinfo)' \
	--eval '(require :clutils)' \
	--eval '(sb-texinfo:document-package :clutils :output-file "clutils.texinfo")'

docs: clutils.texinfo
	makeinfo --no-`split $<
