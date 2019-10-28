- [SSH](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse)

    Execute this in Powershell

    `Get-WindowsCapability -Online | ? Name -like 'OpenSSH*'`

    If the output looks like this, we are good to go.

    ```
    Name  : OpenSSH.Client~~~~0.0.1.0
    State : Installed

    Name  : OpenSSH.Server~~~~0.0.1.0
    State : NotPresent
    ```

- [chocolatey](https://chocolatey.org/docs/installation#installing-chocolatey)

    Package manager like yum, brew, apt for Windows.

- Visual Studio Code

    TODO: install with choco

- Firefox

    TODO: install with choco

- Chrome

    TODO: install with choco

- git

    `choco install git`

- [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)

    No matter how cool Windows becomes, we always need Linux :wink:

    They have a bunch of videos [here](https://blogs.msdn.microsoft.com/commandline/learn-about-windows-console-and-windows-subsystem-for-linux-wsl/). It's not super-clean though.

    Credits: I'm a newcomer to Windows for develoment. I followed got some ideas from [here](https://char.gd/blog/2017/how-to-set-up-the-perfect-modern-dev-environment-on-windows)

- [hyper](https://hyper.is/)

    Execute this in Powershell with admin permissions

    `choco install hyper`

    Otherwise, download and install from web.