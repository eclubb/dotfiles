# Colorized, paginated, diff. Accepts same args as normal diff.
cdiff() {
  colordiff -u -p $* | less -R
}


# autocorrect is more annoying than helpful
unsetopt correct_all


### Aliases ###
# general
alias retag='ctags -R --exclude=.svn --exclude=.git --exclude=log *'

# yum
alias syi='sudo yum install'
alias syup='sudo yum update'
alias syun='sudo yum erase'

# ls
alias l='ls -lAh --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -A --color=auto'

# git
alias ga='git add'
compdef _git ga=git-add
alias gap='git add -p'
compdef _git gap=git-add

alias gb='git branch'
compdef _git gb=git-branch
alias gba='git branch -a'
compdef _git gba=git-branch

alias gc='git commit'
compdef _git gc=git-commit
alias gc!='git commit --amend'
compdef _git gc!=git-commit

alias gco='git checkout'
compdef _git gco=git-checkout

alias gcp='git cherry-pick'
compdef _git gcp=git-cherry-pick

alias gd='git diff'
compdef _git gd=git-diff
alias gdc='git diff --cached'
compdef _git gdc=git-diff

alias gl='git log --pretty=normal'
compdef _git gl=git-log
alias gld='git log --pretty=decorate'
compdef _git gld=git-log
alias glp='gl -p'
compdef _git glp=git-log
alias gls='gl --stat'
compdef _git gls=git-log
alias gcount='git shortlog -sn'
compdef gcount=git

alias gm='git merge'
compdef _git gm=git-merge

alias gmv='git mv'
alias grm='git rm'

alias gpull='git pull'
compdef _git gpull=git-pull
alias gpullr='git pull --rebase'
compdef _git gpullr=git-fetch

alias gpush='git push'
compdef _git gpush=git-push
alias gpoat='git push origin --all && git push origin --tags'

alias gr='git reset'
compdef _git gr=git-reset
alias grh='git reset --hard'
compdef _git grh=git-reset

alias grb='git rebase'
compdef _git grb=git-rebase
alias gri='git rebase -i'
compdef _git gri=git-rebase
alias gra='git rebase --abort'
alias grc='git rebase --continue'

alias gs='git status'
compdef _git gs=git-status
alias gss='git status -s'
compdef _git gss=git-status

alias gst='git stash'
compdef _git gst=git-stash
alias gsl='git stash list'
compdef _git gsl=git-stash
alias gsp='git stash pop'
compdef _git gsp=git-stash
alias gsd='git stash drop'
compdef _git gsd=git-stash

# gem
alias sgi='sudo gem install'
alias sgup='sudo gem update'
alias sgun='sudo gem uninstall'

# rails 3 (these override the corresponding aliases in the git plugin)
alias rs='bundle show thin >/dev/null; if [ $? -eq 0 ]; then rails server thin; else rails server; fi'
alias rsd='rails server -p3001 --debugger'
alias rc='pry -r ./config/environment || rails console'
