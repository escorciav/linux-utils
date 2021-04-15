# Script to backup all conda environment YAML and spec-files

dest_dir=~/install/conda_env
# Update the next line with the name of all your environments
# How to get them? conda list ; follow by manual editing in a text-editor ;)
all_env=
for i in $env_; do
  conda env export -n $i -f $dest_dir/$i".yaml"
  conda env export -n $i --from-history -f $dest_dir/$i"_from-history.yaml"
  conda list --explicit > $dest_dir/$i"_spec.txt"
done
