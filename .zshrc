echo "Running ZSH"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/chris/.oh-my-zsh"

ZSH_THEME="avit"

plugins=(
	git
  zsh-z
	zsh-autosuggestions
	iterm2
	osx
	node
	yarn
	macports
	sudo
	zsh-syntax-highlighting
	docker
	jsontools
	brew
	nvm
	npm
	nmap
	gradle-completion
	vi-mode
)

#ZSH_THEME="powerlevel9k/powerlevel9k"

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

alias vim="nvim"
alias vrc="nvim ~/.vimrc"
alias zrc="nvim ~/.zshrc"
alias webrs="cd ~/development/rust/web/web-rs/"

alias config='/usr/bin/git --git-dir=/Users/chris/.cfg/ --work-tree=/Users/chris'

export PATH="$PATH:/usr/local/bin/"
export PATH="$PATH:/Users/chris/development/emsdk/node/12.9.1_64bit/bin:/Users/chris/development/emsdk/upstream/emscripten:/Users/chris/development/emsdk:/Users/chris/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/Library/Apple/bin:/Library/TeX/texbin:/opt/X11/bin:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Applications/Wireshark.app/Contents/MacOS:/usr/local/bin/:/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin"

