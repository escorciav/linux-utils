# Docker

Packing and reproducible prototype

- [Setup for fedora](https://developer.fedoraproject.org/tools/docker/docker-installation.html).

  The [original documentation](https://docs.docker.com/install/linux/docker-ce/fedora/) of docker is also precise, and amenable.

  - In case `sudo docker []` bothers you, read until the end.

- [Cheatsheet](https://github.com/wsargent/docker-cheat-sheet)

- Notes about [users and permissions](https://denibertovic.com/posts/handling-permissions-with-docker-volumes/)

## Mount a filesystem

Useful if you want to exchange info btw host and container.

- Add this flag `-v [host-dir]:[container-dir]` to the docker command.

More details [here](https://github.com/wsargent/docker-cheat-sheet#volumes)

## Keep username in container

Sometimes you may not want to run things as root. This is useful during development and testing.

```bash
docker run -ti -v /etc/passwd:/etc/passwd -u $(id -u):$(id -g) centos/centos7 bash
```

- `-v /etc/passwd:/etc/passwd` -> share the place where details of users resides in the host.

A longer command a bit more verbose, but helpful

```bash
docker run -ti -v /etc/passwd:/etc/passwd -u $(id -u):$(id -g) -v $(pwd):$(pwd) -w $(pwd) centos/centos7 bash
```

- `-v $(pwd):$(pwd)` -> mount the current directory in the host in the same location in the container.

- `-w $(pwd)` -> go to the previous directory after launching the container.

[Credits](https://stackoverflow.com/questions/45836272/running-as-a-host-user-within-a-docker-container)

## nvidia-docker

AFAIK, the way to go to use GPU inside docker.

- Follow the installation procedure for your distribution from [here](https://github.com/NVIDIA/nvidia-docker).

- For Fedora, Centos' repo may do the trick [1](https://github.com/NVIDIA/nvidia-docker/issues/706#issuecomment-432628382).

### nvidia-docker after upgrade

Upgrades may cause troubles to nvidia-docker. If that's the case, traceback the packages installed and delete them.

The steps that worked for @escorciav are:

1. Remove nvidia-docker

    `sudo dnf remove nvidia-docker2 nvidia-container-runtime-hook nvidia-container-runtime libnvidia-container-tools libnvidia-container1`

2. Reinstall docker (optional)

   It will remove docker, and give you a fresh and clean start.

    ```
    sudo dnf remove docker-ce
    sudo rm -rf /var/lib/docker
    sudo dnf install docker-ce-3:18.09.0-3
    ```

3. Install nvidia-docker

    `sudo dnf install nvidia-docker2`

## Interesting images

- This [post](https://blog.networkprofile.org/what-docker-containers-am-i-running/) detailed a nice arragement of docker images and particular applications. From monitoring till DIY cloud of files&images (dropbox) and series/movies (netflix).