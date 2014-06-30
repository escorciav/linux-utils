#!/bin/sh
# This scripts updates OS based on YUM. It is useful, if you have installed
# nvidia drivers.
#
# TODO
#   - Reinstall NVIDIA drivers. Check comments below.
#
# ! Developer: Victor Escorcia !
# ! Date: 29 May 2014 !

# Parsing inputs
NVIDIA_DRIVER=~/Download/install/NVIDIA-Linux-x86_64-331.67.run
args=$(getopt -l "kernel_update:" -o "d:h" -- "$@")
eval set -- "$args"
while [ $# -ge 1 ]; do
  case "$1" in
    --)
      # No more options left.
      shift
      break
      ;;
    -d|--driver)
      NVIDIA_DRIVER="$2"
      shift
      ;;
    -h)
      echo "Usage: $0 -d NVIDIA_DRIVER_PATH"
      exit 0
      ;;
  esac
  shift
done
echo $NVIDIA_DRIVER

# Check if current kernel is outdated
CHECK_X8664=$(yum update --assumeno --downloadonly | grep kernel.x86_64)
CHECK_i686=$(yum update --assumeno --downloadonly | grep kernel.i686)
KERNEL_UPDATE=$CHECK_i686$CHECK_X8664

if [ -z "$KERNEL_UPDATE" ]
then
  echo "There is no kernel update. Probably, there is not any challenge!!!"
  yum update -y
else
  echo "There is a kernel update. The challenge starts:"
  if [ -z "$(ls $NVIDIA_DRIVER | grep cannot)" ]
  then
    yum update -y
    
    #In order to automate process, I need to modify root bashrc to run this script
    echo "1) sudo init 3"
    echo "2) Login and run nvidia driver installation"
    echo "3) reboot "
  else
    echo "The update cannot continue"
    echo "File $NVIDIA_DRIVER does not exist"
  fi
fi
