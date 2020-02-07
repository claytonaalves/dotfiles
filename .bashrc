rplc() {
    ag -wil $1 | xargs -n1 -I{} sh -c "sed -i -b 's/\<$1\>/$2/gI' {}"
}	

alias ll='ls -lh'
alias diff='colordiff'
alias ping='ping -c 5'
alias ..='cd ..'
alias vigo_server='pushd ~/vigo/scripts; ./serve; popd'
alias trac='tracd -s --port 8000 --basic-auth="trac,/home/clayton/vigo/trac/.htpasswd,Trac" /home/clayton/vigo/trac'
