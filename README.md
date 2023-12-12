# tmux-auto-title

Utility for automatically naming windows/tabs of your tmux terminal.

The script automatically names your tmux tab using the following rules:

- When in a git project
  - Use the name as specified in the of the origin
  - Optionally add current folder name
- Otherwise
  - current directory name
  - current parent and directory name
  - current full path

## Testing

You can test the script without making any modifications in your current `$PS1` as spacified in your rc file.

Start tmux/byobu and type

```Shell
make
```

Alternatively you can just source the testing environment

```Shell
source testing.sh
```

A testing `$PS1` will be configured and you should see the title of your current tmux window change. Go and browse your filesystem.

## Options

- TODO