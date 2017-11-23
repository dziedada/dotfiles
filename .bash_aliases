alias cn="cd ~/maav/nav/src && git branch && git status"
alias cb="cd ~/maav/nav/build && git branch && git status"
alias ca="cd ~/maav/nav/atomcore && git branch && git status"
alias cm="cd ~/maav/nav/build/atomcore/src/zcmtypes"
alias gis="git status"
alias gic="git commit"
alias zsl="zcm-spy-lite -u ipc -p /home/rpash/maav/nav/build/atomcore/src/zcmtypes/libatomcore-msg.so"
alias zsludp="zcm-spy-lite -u udpm://239.255.76.67:7667?ttl=1 -p /home/rpash/maav/nav/build/atomcore/src/zcmtypes/libatomcore-msg.so"
alias cafs="cd /afs/umich.edu/user/r/p/rpash/"
alias ttime="$(which time) -f 'real: %E,  user: %U,  sys: %S,  avg mem: %K,  max mem: %M'"

# Perf
function perf_func(){
	perf record -F 1000 --call-graph dwarf -e cycles:u ${@:1}
}
alias perff="perf_func"


alias yee='printf "\
\n			  ░░░░░░░░░░░░░▄███▄▄▄░░░░░░░\
\n			  ░░░░░░░░░▄▄▄██▀▀▀▀███▄░░░░░\
\n			  ░░░░░░░▄▀▀░░░░░░░░░░░▀█░░░░\
\n			  ░░░░▄▄▀░░░░░░░░░░░░░░░▀█░░░\
\n			  ░░░█░░░░░▀▄░░▄▀░░░░░░░░█░░░\
\n			  ░░░▐██▄░░▀▄▀▀▄▀░░▄██▀░▐▌░░░\
\n			  ░░░█▀█░▀░░░▀▀░░░▀░█▀░░▐▌░░░\
\n			  ░░░█░░▀▐░░░░░░░░▌▀░░░░░█░░░\
\n			  ░░░█░░░░░░░░░░░░░░░░░░░█░░░\
\n			  ░░░░█░░▀▄░░░░▄▀░░░░░░░░█░░░\
\n			  ░░░░█░░░░░░░░░░░▄▄░░░░█░░░░\
\n			  ░░░░░█▀██▀▀▀▀██▀░░░░░░█░░░░\
\n			  ░░░░░█░░▀████▀░░░░░░░█░░░░░\
\n			  ░░░░░░█░░░░░░░░░░░░▄█░░░░░░\
\n			  ░░░░░░░██░░░░░█▄▄▀▀░█░░░░░░\
\n			  ░░░░░░░░▀▀█▀▀▀▀░░░░░░█░░░░░\
\n			  ░░░░░░░░░█░░░░░░░░░░░░█░░░░\
\n\n" && spd-say "YEE"'
function make_func(){
    make ${@:1} && yee
}
function xdg_open(){
	xdg-open ${@:1}
}

alias make="make_func"
alias fucking="sudo"
alias op="xdg_open"
alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."
