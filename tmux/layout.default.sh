
if [ -z "$1" ]; then
    DEFAULT_NAME="default"
else
    DEFAULT_NAME=$1
fi

tmux new-session -s $DEFAULT_NAME -n shell -d

# tmux send-keys -t $DEFAULT_NAME 'cd ~/' C-m

tmux split-window -h -t $DEFAULT_NAME
# 调整大小
tmux resize-pane -R -t $DEFAULT_NAME
tmux resize-pane -R -t $DEFAULT_NAME
tmux resize-pane -R -t $DEFAULT_NAME
tmux resize-pane -R -t $DEFAULT_NAME
tmux resize-pane -R -t $DEFAULT_NAME
tmux resize-pane -R -t $DEFAULT_NAME
tmux resize-pane -R -t $DEFAULT_NAME
tmux resize-pane -R -t $DEFAULT_NAME
tmux resize-pane -R -t $DEFAULT_NAME
tmux resize-pane -R -t $DEFAULT_NAME

tmux send-keys -t $DEFAULT_NAME:1.2 'glow ~/.config/tmux/bindkey.md' C-m
tmux select-pane -L -t $DEFAULT_NAME

tmux attach -t $DEFAULT_NAME

# tmux select-window -t $DEFAULT_NAME:1
# tmux new-window -n console -t $DEFAULT_NAME
# tmux send-keys -t $DEFAULT_NAME:2 'cd ~/devproject' C-m
# tmux send-keys -t $DEFAULT_NAME 'vim' C-m
