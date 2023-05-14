<div align="center">

# t

Zoxide-powered directory-based smart tmux sessions.

</div>

## Usage example

From anywhere in your terminal (even inside tmux), run:

```sh
t <query>
```

This will:

1. `cd` into the first match for `<query>`
2. if zoxide found a match, tmux will attach to the corrsponding session

If no session exists, it will create a new one and attach to it.

## Credit

This is a hyper-minimalist and modest version of [joshmedeski](https://github.com/joshmedeski)'s [t-smart-tmux-session-manager](https://github.com/joshmedeski/t-smart-tmux-session-manager), based on the first version shown on [his video](https://www.joshmedeski.com/posts/smart-tmux-sessions-with-zoxide-and-fzf/).

## Prerequisites

- [tmux](https://github.com/tmux/tmux)
- [zoxide](https://github.com/ajeetdsouza/zoxide)

## Installation

### From wherever in your terminal, run the following

```sh
git clone git@github.com:maxiskell/t.git && mv t/t /usr/local/bin && rm -rf t
```

### Recommended tmux settings

Add these settings to your `tmux.conf` for a better experience.

```sh
# don't exit from tmux when closing a session
set -g detach-on-destroy off

# skip "kill-pane 1? (y/n)" prompt
bind x kill-pane
```
