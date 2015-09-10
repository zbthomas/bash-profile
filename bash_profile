###################################
# Show Git branch info
###################################
function parse_git_dirty() {
  [[ ($(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ) && ($(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ) ]] && echo "*"
}
function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\u:\[\033[31;38m\]\w\[\033[0;33m\]$(parse_git_branch)\[\e[0m\]\n$ '

###################################
# Git aliases
###################################
alias ga="git add ."
alias gc="git commit"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gbd="git branch -D"
alias gbtrack="git branch --track"
alias gf="git fetch"
alias gpu="git pull"
alias gph="git push"
alias gm="git merge"
alias gsr="git show-ref"
alias gs="git status"
alias gr="git remote -v"
alias glp="git log --pretty"
alias glno="git show --pretty="format:" --name-only"
