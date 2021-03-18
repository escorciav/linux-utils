# Visual Studio Code

Developer editor almost like an IDE.

- [Install](https://code.visualstudio.com/Download)

  Use the provided package foor the system.

  There is a cask for [OSX](https://github.com/Homebrew/homebrew-cask/blob/master/Casks/visual-studio-code.rb).

## Suggested extensions

- Python@Microsoft

- Docker@Microsoft

- Remote SSH@Microsoft

- Visual Studio IntelliCode@Microsoft DevLabs

- Markdown Preview Github Styling

- Rainbow CSV

## Settings

- Disable telemetry

- Files: Trim Trailing Whitespace -> True

- Files: Insert Final Newline -> True

- Files: Trim Final Newlines -> True

- Editors rules

```
"[git-commit]": {"editor.rulers": [50]},
"[python]": {
    "editor.rulers": [
        79,
        120
    ]
}
```

## Tricks

### Weak internet connection - remote ssh

Are you using the MS-remote-ssh extension, but your internet connection is intermittent?

Do you experience a lot of reconnection when using MS-Python-extension?

Solution: Add this to your `settings.json`

```json
{
  "python.terminal.activateEnvironment": false,
}
```

Credits: Abhinav Mehrotra & Lukasz Dudziak. TODO: ref vscode issue.

### Too many files in project folder

Sometimes I add simlinks into my project folders with a bunch of files (images, videos, etc.). If so, you will eventuall get a pop-up complaining about it. It will send you [here](https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc)

## Suggested readings

- Opinion, auto-setup and extensions [here](https://fredrikaverpil.github.io/2017/02/02/my-vscode-setup/). 👍 @ModarTensai.
