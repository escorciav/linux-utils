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

## Suggested readings

- Opinion, auto-setup and extensions [here](https://fredrikaverpil.github.io/2017/02/02/my-vscode-setup/). 👍 @ModarTensai.
