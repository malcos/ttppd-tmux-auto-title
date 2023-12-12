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

## Installing

- Copy file into your home folder and source it from your rc file
- Add `$(__tmux_title)` somewhere in your `$PS1`

For example

```Shell
export PS1='$(__tmux_title)[\u@\h]\$ '
```

## Options

You can use the following functions from terminal in order to change the behavior of the script

- `ttdir`: automatically set the title to the current directory name
- `ttparent`: automatically set the title to using the two last directories in the current path.
- `ttpwd`: automatically set the title to the present working directory
- `ttoff`: disable automatic titles and reset current title
- `ttset`: disable automatic titles and set current title to the specified first argument

## Improvements

- Option to disable git project detection
- Option to add relative path to current git project name
