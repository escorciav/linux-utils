# Fedora

Linux OS

## Disk partition

1. Unplug disks except for disk for system

2. Use recommended partition.

    - For dual-boot with Windows, include a `/boot/efi` partition of 256MiB.

  _Suggested partitions sizes_

  - `/` >= 70GiB, (at least) double if you plan to use docker.

  - swap == min(16GiB, system memory)

## Recommendations after install it

1. Update terminal preferences

    - TODO

2. [Set Hostname](https://www.tecmint.com/things-to-do-after-fedora-26-installation/)

3. Update system `sudo dnf update`

4. ssh: enable it on boot and restart

    ```bash
    sudo systemctl enable sshd
    sudo systemctl restart sshd
    ```

5. Add steroids

    ```bash
    sudo dnf install htop iotop glances screen vim-enhanced powerline powerline-fonts tmux-powerline vim-powerline environment-modules fuse-sshfs dkms kernel-devel acpid libglvnd-glx libglvnd-opengl libglvnd-devel pv gnome-tweak-tool p7zip p7zip-plugins icedtea-web java-openjdk transmission tmux gcc pkgconfig unzip kernel-headers
    ```

    - Packages from `htop` onward are to monitor computer load.

    - Packages from `screen` onward are to create persistent shell-session.

    - Packages from `vim-enhanced` onward for code editing and beautify shell or VIM.

    - Packages from `environment-modules` is to manipulate environment variables.

    - Packages from `fuse-sshfs` is to mount remote filesystem via ssh.

    - Packages from `dkms` onward to setup nvidia-driver.

    - Package `pv` is progress-bar useful to keep an eye on tar/untar

    - Packages from `gnome-tweak-tool` customize gnome. Display minimize in top-bar.

    - Packages from `p7zip` onward are for uncompress files.

    - Packages from `icedtea-web` onward are for java&web-toolkit.

    - Package `transmission` is for torrents.

6. [Tweak dnf](https://robbinespu.gitlab.io/blog/2019/05/06/after-install-fedora-30/)

    Ignore the deltarpm.

7. Tweak Gnome

    - Open `Tweaks`
    
    - Enable maximize and minimize button: Go to Window Titlebar 😉 

7. Install VSCode. Check [this](./vscode.md).

7. Enable video support. Reuqired for firefox

    - Add RPMFusion repo
  
      ```bash
      sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
      sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
      ```
  
    - Add gstreamer and ffmpeg.
  
      ```bash
      sudo dnf install \
          gstreamer-plugins-base \
          gstreamer1-plugins-base \
          gstreamer-plugins-bad \
          gstreamer-plugins-ugly \
          gstreamer1-plugins-ugly \
          gstreamer-plugins-good-extras \
          gstreamer1-plugins-good \
          gstreamer1-plugins-good-extras \
          gstreamer1-plugins-bad-freeworld \
          ffmpeg \
          gstreamer-ffmpeg
      ```

      TODO: are all this required?

    Credits: [Robbi](https://robbinespu.gitlab.io/blog/2019/05/06/after-install-fedora-30/)

7. Install Chrome.

    > Developing websites and open awkward pages design only for Chrome.

7. Install flatpack programs

    VLC, slack, etc.

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

# Other extensions

TODO: review them

- For [Gnome](https://www.dedoimedo.com/computers/fedora-30-after-install.html)

- For [firefox](https://fosspost.org/tutorials/things-to-do-after-installing-fedora)