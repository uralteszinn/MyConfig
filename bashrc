#
# ~/.bash.drc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /etc/profile

source /home/laurin/.bash.d/environment

source /home/laurin/.bash.d/colors
source /home/laurin/.bash.d/aliases
source /home/laurin/.bash.d/completion

source /home/laurin/.bash.d/prompt

source /home/laurin/.bash.d/init
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
