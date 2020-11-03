## [conda]()

url: https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
version: latest

### Setup

```bash
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh -b -p $USER_HOME/miniconda3
cd $USER_LOCAL/miniconda3
echo WIP, due to conflict with bashrc_export steps printed but you must do it and fix issue
echo Type: ./conda init
echo Go to .bashrc and fix the issue associated with our if statement before (intrusive) conda does its job
```

Miniconda will be installed in $USER_LOCAL/miniconda3 :)

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

## [NCCL](https://github.com/NVIDIA/nccl/tree/master)

git_rul: https://github.com/NVIDIA/nccl.git
version: v1.3.0-1

### Recipe

```bash
make -j 12 CUDA_HOME=/path/to/your/cuda
```

### Notes

Take care of the version of gcc compiler
