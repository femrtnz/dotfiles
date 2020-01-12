# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/felipemartinez/.oh-my-zsh"

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

############# FZF ############# 
alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

############### Go development #############
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

############# K8s ###########
export KUBECONFIG=$HOME/.kube/config
alias k="kubectl"
alias kc="kubectx"
alias kn="kubens"

############# Google ###########
alias g="gcloud"


############ Terraform #########
alias t="terraform"

############ GIT ##############

gitlog() {
  git log --oneline --decorate --all --graph
}

############ K8s ##############

kv(){  
  kubectl get pod $1 -o jsonpath="{..image}" |  awk -F":" '{ print $3}'
}

kx(){  
  kubectl exec -it $1 -- bash
}




