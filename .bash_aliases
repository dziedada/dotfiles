alias vi="vim"
alias zsl="zcm-spy-lite -u ipc -p /home/rpash/maav/nav/build/atomcore/src/zcmtypes/libatomcore-msg.so"
alias zsludp="zcm-spy-lite -u udpm://239.255.76.67:7667?ttl=1 -p /home/rpash/maav/nav/build/atomcore/src/zcmtypes/libatomcore-msg.so"
alias ttime="$(which time) -f 'real: %E, user: %U, sys: %S, avg mem: %K, max mem: %M'"
alias yee='printf "\
===========================================================================\n\
===========================================================================\n\
===========================================================================\n\
===========================================================================\n\'
function make_func(){
    make ${@:1} && yee
}
function xdg_open(){
 xdg-open ${@:1}
}

alias make="make_func"
alias fucking="sudo"
alias op="xdg_open"

# mkdir and cd combo
mkcd_func () {
	case "$1" in
 		*/..|*/../) cd -- "$1";;
		/*/../*) (cd "${1%/../*}/.." && mkdir -p "./${1##*/../}") && cd -- "$1";;
		/*) mkdir -p "$1" && cd "$1";;
		*/../*) (cd "./${1%/../*}/.." && mkdir -p "./${1##*/../}") && cd "./$1";;
		../*) (cd .. && mkdir -p "${1#.}") && cd "$1";;
		*) mkdir -p "./$1" && cd "./$1";;
	esac
}
