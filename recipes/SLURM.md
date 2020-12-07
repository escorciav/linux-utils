# SLURM

IMO the best software to manage shared compute resources.

> Yet, you assign researchers to manage clusters part-time and you ended up with people re-inventing the wheel, and leaving everyone unsatisfied. Sorry for the rant.

## Interactive sessions

### Multi-core session without GPUs

`srun --partition=long --time=4-18:00:00 --cpus-per-task=32 --pty bash -l`

### Multi-core session without GPUs

```bash
srun --gres=gpu:titanx:1 --time=1:00:00 --pty bash -l
```

The previous command requests 1 TitanX GPU (`--gres=gpu:titanx:1`) for 1 hour (`--time=1:00:00`) and launch a bash session.

## Gather info about job

### List detailed information of job

Run it for troubleshooting or if you delete your scripts :wink:

`scontrol show jobid -dd [jobid]`

## Gather info about the cluster

### Info about nodes

`sinfo -o "%n %A %D %P %T %c %z %m %d %w %f %G"`

TODO: explain what all those `%?` means. low-priority in favor of using [this](https://github.com/escorciav/kaust-cluster-status#new-request-protocol---help-wanted).

### Info about the queue

`squeue -o "%u %i %t %b %N"`

Useful if there aren't a ton of jobs. If there are, check [this](https://github.com/escorciav/kaust-cluster-status)

TODO: explain what all those `%?` means. low-priority in favor of using [this](https://github.com/escorciav/kaust-cluster-status#new-request-protocol---help-wanted).

### Show reservation

`scontrol show reservation | grep -A 3 GROUP_IVUL`

### List node info

`scontrol -o show node`

## Control execution of your jobs

### Cancel jobs

`scancel [jobid(s)]`

The (s) means that you can pass multiple e.g. 1_[3-4] will cancel task 3-4 of job-id 1.

### Holding a job

`scontrol hold [jobid(s)]`

Example:

`scontrol hold 57829_11-80`

in that case the elements `11-80` from the job-array `57829` are held.

Useful cases:
- edit your config files or code while job was already dispatched.
- be a nice friend, share cluster with others.

### Release a job

Useful after you held your jobs.

`scontrol release [jobid(s)]`

### Update array throttle

You can limit and update the number of jobs running concurrently with the following command:

`scontrol update ArrayTaskThrottle=12 JobId=57829`

That will limit the number of concurrent items in the array of the job id `57829` to `12`.

That's useful when no one was using the cluster, but suddenly in the afternoon few people need resources but you are consuming them :wink: 

[Credits](https://help.rc.ufl.edu/doc/SLURM_Job_Arrays#Using_scontrol_to_modify_throttling_of_running_array_jobs)

## Jobs arrays

Allow to submit a collection of similar jobs. You should use the argument `--array` in order to make use of this feat.

Be aware of these environment variables to modularize your script `SLURM_JOB_ID`, `SLURM_ARRAY_JOB_ID `, `SLURM_ARRAY_TASK_ID `.

You can read more about it [here](http://slurm.schedmd.com/job_array.html)

## Useful URLs

There must be moany websites about this but [**this**](https://rc.fas.harvard.edu/resources/documentation/convenient-slurm-commands/) is really handy. I index some commands from there here :smile:  

## Backlog

Written while I was KAUST.

### GPU device ID

It seems that SLURM takes care of setting `CUDA_VISIBLE_DEVICES` properly for you, thus you don't have to worry about that. AFAIK, it uses 0 indexed notation. If you request 1 GPU, your device will be the number `0`. You got the pattern, right? if not feel free to ask :wink: .

I tested this in the past. The conclusion was to **not** use the content of `CUDA_VISIBLE_DEVICES` in your program. Why? check [this example](https://github.com/escorciav/admin.dl/tree/master/slurm/set_device) and the conclusions.

You can read more about it, [here](http://slurm.schedmd.com/gres.html)
