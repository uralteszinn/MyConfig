HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000

bindkey -v
source /home/laurin/.colemak/zshrc

#setopt appendhistory incappendhistory sharehistory histverify histignoredups histreduceblanks
#setopt auto_cd
#setopt no_beep
#setopt correct

source /home/laurin/.zsh.d/aliases

unalias j 2>/dev/null
source /etc/profile.d/autojump.zsh
#autoload -U compinit && compinit

#source /home/laurin/.zsh.d/prompts/mycommand

#zstyle :compinstall filename '/home/laurin/.zshrc'
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


#autoload -Uz compinit
#compinit


if [[ "$TTY" == /dev/tty1 ]]
  then startx
fi
