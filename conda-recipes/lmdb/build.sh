cd liblmdb
sed -i 's@prefix\t= /usr/local@prefix\t?= /usr/local@g' Makefile
make all

mkdir $PREFIX/man
make install prefix=$PREFIX
