echo "Running ZSH"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/chris/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	git
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

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias config='/usr/bin/git --git-dir=/Users/chris/.cfg/ --work-tree=/Users/chris'
