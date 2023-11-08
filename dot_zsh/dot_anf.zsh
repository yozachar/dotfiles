#!/usr/bin/zsh

# Aliases and Functions

# aliases
alias ls='ls --color=auto'
alias ls='exa -g -h --group-directories-first'
alias ols='ls --octal-permissions'
alias cat='bat -p'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
#alias man='tldr'
alias which='whence -p'
alias rg='rg --engine=auto'
#alias docker='podman'

# functions
psl() {
    code=047
    print -P -- "\n%F{$code}Processes:%f"
    podman ps -a
    print -P -- "\n%F{$code}Pods:%f"
    podman pod ls
    print -P -- "\n%F{$code}Containers:%f"
    podman container ls -a
    print -P -- "\n%F{$code}Images:%f"
    podman image ls
    print -P -- "\n%F{$code}Volumes:%f"
    podman volume ls
    print -P -- "\n%F{$code}Networks:%f"
    podman network ls
    print -P -- "\n%F{$code}Secrets:%f"
    podman secret ls
    printf ''
}

function tree {
     br -c :pt "$@"
}
