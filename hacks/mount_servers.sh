#!/bin/bash
# """
# Mount servers of interest in the location of this script
#
# Requirements: sshfs
#
# """
script_dirname="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Edit your list of servers here
server_name=(ivul-gpu ivul-gpu noor-gpu noor-gpu smc)
# Edit your local-point-names here
local_name=(ivul-gpu gpu-vcc noor-gpu ng-scratch smc-vcc)
# Edit your remote-point-dir here
remote_dir=(/home/escorcv /vcc /home/escorcv /scratch/escorcv /vccscratch)

# Input parsing
usage() { echo "Usage: $0 -m/-u" 1>&2; exit 1; }
while getopts ":mu" o; do
  case "${o}" in
    m)
      mount=true
      ;;
    u)
      mount=false
      ;;
    *)
      usage
      ;;
  esac
done
shift $((OPTIND-1))

if [ -z "${mount}" ]; then
  usage
fi

# Mount/Umount
for i in ${!server_name[@]}; do
  local_point=$script_dirname/${local_name[$i]}
  mkdir -p $local_point
  if [ "$(ls -A $local_point )" ]; then
    if [ ! $mount ]; then
      umount $local_point
    fi
  else
    if $mount; then
      sshfs ${server_name[$i]}:${remote_dir[$i]} $local_point
    fi
  fi
done
