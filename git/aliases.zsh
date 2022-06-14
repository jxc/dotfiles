alias g='git'
compdef g=git
alias gst='git status -sb'
compdef _git gst=git-status
alias gd='git diff --color --color-words --abbrev'
compdef _git gd=git-diff
alias gdc='git diff --cached'
compdef _git gdc=git-diff
alias gdt='git diff-tree --no-commit-id --name-only -r'
compdef _git gdc=git diff-tree --no-commit-id --name-only -r
alias gl='git pull'
compdef _git gl=git-pull
alias gup='git pull --rebase'
compdef _git gup=git-fetch
alias gp='git push'
compdef _git gp=git-push
alias gpt='git push --tags'
compdef _git gpt=git-push
alias gpF='git push --force-with-lease'
compdef _git gp=git-push-force-with-lease
alias gd='git diff'
gdv() { git diff -w "$@" | view - }
compdef _git gdv=git-diff
alias gdt='git difftool'
alias gc='git commit -v'
compdef _git gc=git-commit
alias gc!='git commit -v --amend'
compdef _git gc!=git-commit
alias gca='git commit -v -a'
compdef _git gc=git-commit
alias gca!='git commit -v -a --amend'
compdef _git gca!=git-commit
alias gcmsg='git commit -m'
compdef _git gcmsg=git-commit
alias gco='git checkout'
compdef _git gco=git-checkout
alias gcm='git checkout main'
alias gr='git remote'
compdef _git gr=git-remote
alias grv='git remote -v'
compdef _git grv=git-remote
alias grmv='git remote rename'
compdef _git grmv=git-remote
alias grrm='git remote remove'
compdef _git grrm=git-remote
alias grset='git remote set-url'
compdef _git grset=git-remote
alias grup='git remote update'
compdef _git grset=git-remote
alias grbi='git rebase -i'
compdef _git grbi=git-rebase-interactive
alias grbc='git rebase --continue'
compdef _git grbc=git-rebase-continue
alias grba='git rebase --abort'
compdef _git grba=git-rebase-abort
alias grbs='git rebase --skip'
compdef _git grbc=git-rebase-skip
alias gb='git branch'
compdef _git gb=git-branch
alias gba='git branch -a'
compdef _git gba=git-branch
alias gbr='git branch --remote'
alias gcount='git shortlog -sn'
compdef gcount=git
alias gcl='git config --list'
alias gcp='git cherry-pick'
compdef _git gcp=git-cherry-pick
alias glg='git log --stat --max-count=10'
compdef _git glg=git-log
alias glgg='git log --graph --max-count=10'
compdef _git glgg=git-log
alias glgga='git log --graph --decorate --all'
compdef _git glgga=git-log
alias glo='git log --oneline --decorate --color'
compdef _git glo=git-log
alias glog='git log --oneline --decorate --color --graph'
compdef _git glog=git-log
alias glol="git log  --color --graph --pretty=format:'%Cred%h%Creset%x09%C(yellow)%d%Creset %s %C(cyan)(%cr) %C(blue)[%an]%Creset' --abbrev-commit"
compdef _git glol=git-log
alias gss='git status -s'
compdef _git gss=git-status
alias ga='git add'
compdef _git ga=git-add
alias g_addAllAndCommit="ga .; gcmsg"
alias gap='git add --patch'
alias gm='git merge'
compdef _git gm=git-merge
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gclean='git reset --hard && git clean -dfx'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias gf='git fetch --all --prune'

alias gpoat='git push origin --all && git push origin --tags'
alias gmt='git mergetool --no-prompt'
compdef _git gm=git-mergetool

alias gg='git gui citool'
alias gga='git gui citool --amend'
alias g_amendAll="ga .; g commit --amend --no-edit"
alias gk='gitk --all --branches'

alias gsts='git stash show --text'
alias gsta='git stash'
alias gstp='git stash pop'
alias gstd='git stash drop'

# DOCKER
alias dk='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Will cd into the top of the current repository
# or submodule.
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'

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

# these aliases take advantage of the previous function
alias ggpull='git pull origin $(current_branch)'
compdef ggpull=git
alias ggpur='git pull --rebase origin $(current_branch)'
compdef ggpur=git
alias ggpush='git push origin $(current_branch)'
compdef ggpush=git
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
compdef ggpnp=git

# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
alias glp="_git_log_prettily"
compdef _git glp=git-log

# these alias ignore changes to file
alias gignore='git update-index --assume-unchanged'
alias gunignore='git update-index --no-assume-unchanged'
# list temporarily ignored files
alias gignored='git ls-files -v | grep "^[[:lower:]]"'

# Rebase branch on master
function colorTail() {
  tail -f $1 | awk '
/INFO/ {print "\033[32m" $0 "\033[39m"}
/Exception/ {print "\033[31m" $0 "\033[39m"}'
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

function g_tagAndPush() {
  figlet "TAG 'N PUSH TIME!"
  gcm
  g tag -a $@
  g push --tag origin
}

function in_each_ruby_dir(){
  local root=$(git rev-parse --show-toplevel)
  cd $root
  for g in $(find . -name 'Gemfile'); do
    pushd $(dirname ${g})
    $@
    popd
  done
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