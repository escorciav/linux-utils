# Docker

Packing and reproducible prototype

- [Setup for fedora](https://developer.fedoraproject.org/tools/docker/docker-installation.html)

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