# 日本語対応
export LANG='ja_JP.UTF-8'

# lsの結果を色付きで表示してくれる
alias ls="ls --color=auto"
# ○○するときに、本当に○○していいか聞いてくれる系のエイリアス
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'


# .. だけで親ディレクトリにいける！
alias ..='cd ..'

# laで隠しファイルも含めて全部表示してくれる
alias la="ls -a"

# git系のエイリアス
alias gb="git branch"
alias gco='git checkout'
alias gcm='git checkout master'
alias gl='git pull'
alias gc='git commit'
alias gp='git push'
alias gst='git status'
alias ga='git add'

# プロンプト
source /home/developer/.git-prompt.sh
PS1='\[\e[37;45m\] \t \[\e[35;47m\]\[\e[30;47m\] \W \[\e[37;46m\]\[\e[30m\] $(__git_ps1 "(%s)") \[\e[36;49m\]\[\e[0m\] '
