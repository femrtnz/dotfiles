# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

add_to_path() {
    local dir re

    for dir; do
        re="(^$dir:|:$dir:|:$dir$)"
        if ! [[ $PATH =~ $re ]]; then
            PATH="$PATH:$dir"
        fi
    done
}

add_to_path $HOME/bin
add_to_path /usr/local/bin
add_to_path $HOME/.tgenv/bin
add_to_path ${HOME}/Library/Python/3.7/bin
add_to_path ${HOME}/workspace/gitsync/bin

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

ggrep(){
  grep -R "$1" *
}

plugins=(
    git
    kubectl
    zsh-autosuggestions
    vault
)

source $ZSH/oh-my-zsh.sh

##### JENV ####
# add_to_path $HOME/.jenv/bin
# eval "$(jenv init -)"

# ensure that JAVA_HOME is correct
# jenv enable-plugin export
# make Maven aware of the Java version in use (and switch when your project does)
# jenv enable-plugin maven

############# FZF ############# 
alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

############### Go development #############
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

############# Google ###########
add_to_path ${HOME}/google-cloud-sdk/bin

source ${HOME}/google-cloud-sdk/bin/completion.zsh.inc

alias g="gcloud"
source ${HOME}/.gcloud-config-badge

############ Terraform #########
alias t="terraform"

############ GIT ##############

gitlog() {
  git log --oneline --decorate --all --graph
}
git config --global core.excludesfile ~/.gitignore_global

############ K8s ##############

export KUBECONFIG=$HOME/.kube/config
alias k="kubectl"
alias kc="kubectx"
alias kn="kubens"

kv(){  
  kubectl get pod $1 -o jsonpath="{..image}" |  awk -F":" '{ print $3}'
}

kx(){  
  kubectl exec -it $1 -- bash
}


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

git config --global core.excludesfile ~/.gitignore_global
