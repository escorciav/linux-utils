## [openblas](http://www.openblas.net/)

git_url: https://github.com/xianyi/OpenBLAS.git
version: 0.2.19

### Recipe

```bash
make
make PREFIX=/path/to/your/installation install
```

## [torch]()

git_url: https://github.com/torch/distro.git

### Dependencies

- gcc
- openblas
- ipython
```bash
sudo dnf install cmake curl readline-devel ncurses-devel nodejs npm czmq czmq-devel libjpeg-turbo-devel libpng-devel ImageMagick GraphicsMagick-devel fftw-devel sox-devel sox qt-devel qtwebkit-devel`
```

### Recipe

```
./install_hack.sh
```
