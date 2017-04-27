unbind C-b
set -g prefix C-a

set -g default-terminal "screen-256color"
set -g mouse on

# move x clipboard into tmux paste buffer
bind C-p run "tmux set-buffer \"$(xclip -o)\"; tmux paste-buffer"
# move tmux copy buffer into x clipboard
bind C-y run "tmux show-buffer | xclip -i"
