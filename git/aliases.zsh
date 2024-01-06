alias g='git'
alias gst='git status -sb'
alias gl='git pull --prune'
alias glog="git log --graph --decorate --oneline --abbrev-commit"
alias glga="glog --all"
alias gp='git push origin HEAD'
alias gpa='git push origin --all'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcm='git checkout main'
alias gpF='git push --force-with-lease'
alias gcp='git cherry-pick'
alias gb='git branch -v'
alias ga='git add'
alias gaa='git add -A'
alias gap='git add --patch'
alias gcam='git commit -a -m'
alias gs='git status -sb'
alias gpr='gp && git pr'
alias glnext='git log --oneline $(git describe --tags --abbrev=0 @^)..@'
alias gf='git fetch --all --prune'
alias gm='git merge'
alias gsts='git stash show --text'
alias gsta='git stash'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias glol="git log  --color --graph --pretty=format:'%Cred%h%Creset%x09%C(yellow)%d%Creset %s %C(cyan)(%cr) %C(blue)[%an]%Creset' --abbrev-commit"
alias g_addAllAndCommit="ga .; gcmsg"
alias g_amend_all="ga .; g commit --amend --no-edit"

gi() {
	curl -s "https://www.gitignore.io/api/$*"
}

# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
alias glp="_git_log_prettily"

# Find lost shit
alias g_findDeletedFiles="git log --diff-filter=D —summary"
alias g_findAnyMentionOfFile="g rev-list --all"
alias g_findString="g log -S"

#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

function g.currentBranch {
  br=`git branch | grep "*"`
  echo ${br/* /}
}

function g_rebase_me() {
  figlet "REBASE OFF MAIN TIME!"

  currentBranch=`g.currentBranch`
  echo "Current branch: '$currentBranch', switching to main..."

  gcm
  gl
  echo "Back to '$currentBranch'..."
  gco $currentBranch
  g rebase main
}

function g_make_branch() {
  input=$@
  result=${input// /-}
  gco -b $result
}

#######################
# NEW FANCY FZF STUFF #
#######################

# gch - checkout a branch
###########################
gch() {
 git checkout "$(git branch | fzf | tr -d '[:space:]')"
}

# gch_all - same as `gch`, but with all branches
###########################
gch_all() {
 git checkout "$(git branch --all | fzf | tr -d '[:space:]')"
}

# gbd - delete branch(es)
###########################
gbd() {
 local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" | fzf --multi ) &&
  git branch -D $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fgl 'some words' - select among figlet fonts form the given string
fgl() {
  [ $# -eq 0 ] && return
  cd /usr/local/Cellar/figlet/*/share/figlet/fonts
  local font=$(ls *.flf | sort | fzf --no-multi --reverse --preview "figlet -f {} $@" --preview-window up) &&
  figlet -f "$font" "$@" | pbcopy
}