# history settings
shopt -s histappend
shopt -s cmdhist

HISTFILESIZE=100000
HISTSIZE=100000
HISTCONTROL=ignoredups
HISTTIMEFORMAT='%F %T '

# save history after running any command,
# not only when closing a bash session
PROMPT_COMMAND='history -a'

# terminal variables

# workdir and exit code
PS1='\w ($(echo $?))\$ '

EDITOR=vim

# aliases
alias ll="ls -l"

for s in $HOME/.bash_source.d/*
do
	source "$s"
done

