cd liblmdb
sed -i 's@prefix\t= /usr/local@prefix\t?= /usr/local@g' Makefile
sed -i 's@$(DESTDIR)$(prefix)/bin;@$(DESTDIR)$(prefix)/bin/;@g' Makefile
sed -i 's@$(DESTDIR)$(prefix)/include;@$(DESTDIR)$(prefix)/include/;@g' Makefile
sed -i 's@$(DESTDIR)$(prefix)/lib;@$(DESTDIR)$(prefix)/lib/;@g' Makefile
sed -i 's@$(DESTDIR)$(prefix)/man/man1;@$(DESTDIR)$(prefix)/man/man1/;@g' Makefile
make all

for i in bin lib include man/man1; do mkdir -p $PREFIX/$i; done
make install prefix=$PREFIX
