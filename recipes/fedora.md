# Fedora

Linux OS

## Setup

TODO: describe partition strategy.

## Recommendations after install it

### Add steroids

```bash
sudo dnf update
sudo dnf install htop iotop tmux screen vim-enhanced powerline powerline-fonts tmux-powerline vim-powerline environment-modules fuse-sshfs gcc pkgconfig dkms kernel-devel kernel-headers acpid libglvnd-glx libglvnd-opengl libglvnd-devel
```

- Packages from `htop` ongoing are to monitor computer load.

- Packages from `tmux` ongoing are to create persistent shell-session.

- Packages from `vim-enhanced` are for code editing and beautify shell or VIM.

- Packages from `gcc` ongoing are for C/C++ development.

- Packages from `gcc` ongoing are for C/C++ development.

- Packages from `dkms` afterwards to setup nvidia-driver.

- Packages to consider

  - `pv`: useful to keep track of things such as taring :thinking:

### ssh: enable it on boot and restart

```bash
sudo systemctl enable sshd
sudo systemctl restart sshd
```

### VSCode

Check [this](./vscode.md).

### Docker

Check [this](./docker.md).

### Supercharge terminal with power-line

In case, you haven't installed power-line. Nice article [here](https://fedoramagazine.org/add-power-terminal-powerline/) if you are a shell lover.

__Caveats__

If you get an error related with `inotify limits` (details below). Follow [this](https://github.com/guard/listen/wiki/Increasing-the-amount-of-inotify-watchers) to fix it.

```
Traceback (most recent call last):
  File "<string>", line 12, in <module>
  File "/usr/lib/python3.6/site-packages/powerline/__init__.py", line 913, in setup
    self.do_setup(*args, **kwargs)
  File "/usr/lib/python3.6/site-packages/powerline/vim.py", line 211, in do_setup
    self.update_renderer()
  File "/usr/lib/python3.6/site-packages/powerline/__init__.py", line 859, in update_renderer
    self.create_renderer(**cr_kwargs)
  File "/usr/lib/python3.6/site-packages/powerline/__init__.py", line 598, in create_renderer
    self.config_loader.set_watcher(self.common_config['watcher'])
  File "/usr/lib/python3.6/site-packages/powerline/lib/config.py", line 84, in set_watcher
    self.watcher.transfer_calls(watcher)
  File "/usr/lib/python3.6/site-packages/powerline/lib/config.py", line 49, in transfer_calls
    getattr(watcher, attr)(*args, **kwargs)
  File "/usr/lib/python3.6/site-packages/powerline/lib/watcher/inotify.py", line 100, in watch
    self.handle_error()
  File "/usr/lib/python3.6/site-packages/powerline/lib/inotify.py", line 138, in handle_error
    raise OSError(eno, self.os.strerror(eno) + str(extra))
OSError: [Errno 28] No space left on deviceYou may need to increase the inotify limits on your system, via /proc/sys/fs/inotify/max_user_*
```

## Build RPM

- The best [guide](https://ask.fedoraproject.org/en/question/87205/how-do-i-install-a-src-rpm-with-dnf/) to compile RPMs as non-root user.

  I would just add that you can replace gcc by the specs-file (with `.specs` extension) for the step `sudo dnf builddep gcc`