#!/bin/sh

if [ "$1" = "-h" ] || [ "$1" == "--help" ]; then
	echo "\nt - zoxide-powered smart tmux sessions\n"
	echo "Usage: t <query>\n"
	exit 0
fi

ZOXIDE_MATCH=$(zoxide query $1)

if [ -z "$ZOXIDE_MATCH" ]; then
  exit 0
fi

DIR_NAME=$(basename $ZOXIDE_MATCH)
SESSION=$(tmux list-sessions -F '#S' | rg $DIR_NAME )

if [ -z "$TMUX" ]; then
  if [ -z "$SESSION" ]; then
    cd $ZOXIDE_MATCH
    tmux new-session -s $DIR_NAME
  else
    tmux attach -t $SESSION
  fi
else
  if [ -z "$SESSION" ]; then
    cd $ZOXIDE_MATCH
    tmux new-session -d -s $DIR_NAME
    tmux switch-client -t $DIR_NAME
  else
    tmux switch-client -t $SESSION
  fi
fi
