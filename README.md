General purpose scripts, commands, profiles and recipes used many times/machines.

---

# Organizing your workspace

1. Password less interactions

    Do it for interacting with github or similar services or accessing other computers.

    - Follow this [help](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/).

    - If security is a concern, read [this](https://developer.github.com/guides/using-ssh-agent-forwarding/) instead of using/launching ssh-agent.

2. Setup dotfiles.

    Company, office, desktop? the computer and the shell is my real workspace.

    - Clone [dotfiles](https://github.com/escorciav/linux-utils).

    - Edit according to the demand of the task on that machine.

3. SSH

    If dealing with other computers often. Take five minutes for this.

    - Copy and paste [this](#.ssh/config) into `.ssh/config` in $HOME.

# Recipes

Notes about programs and configurations.

- [Fedora](recipes/fedora.md)

- [Docker](recipes/docker.md)

- [vscode](recipes/vscode.md)

- [tmux](recipes/tmux.md)