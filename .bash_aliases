alias cn="cd ~/maav/nav/src && git branch && git status"
alias cb="cd ~/maav/nav/build && git branch && git status"
alias ca="cd ~/maav/nav/atomcore && git branch && git status"
alias cm="cd ~/maav/nav/build/atomcore/src/zcmtypes"
alias cs="cd ~/maav/sim"
alias gis="git status"
alias gic="git commit"
alias zsl="zcm-spy-lite -u ipc -p /home/rpash/maav/nav/build/atomcore/src/zcmtypes/libatomcore-msg.so"
alias zsludp="zcm-spy-lite -u udpm://239.255.76.67:7667?ttl=1 -p /home/rpash/maav/nav/build/atomcore/src/zcmtypes/libatomcore-msg.so"
alias zsludp1="zcm-spy-lite -u udpm://239.255.76.67:14551?ttl=1 -p /home/rpash/maav/nav/build/atomcore/src/zcmtypes/libatomcore-msg.so"
alias cafs="cd /afs/umich.edu/user/r/p/rpash/"
alias ttime="$(which time) -f 'real: %E,  user: %U,  sys: %S,  avg mem: %K,  max mem: %M'"
alias spotify="spotify --force-device-scale-factor=2"
alias cd="cd_func"


# Perf
function perf_func(){
	perf record -F 1000 --call-graph dwarf -e cycles:u ${@:1}
}
alias perff="perf_func"


alias yee='printf "\
\n──────────────────────────────────────███████──███████   \
\n──────────────────────────────────████▓▓▓▓▓▓████░░░░░██  \
\n────────────────────────────────██▓▓▓▓▓▓▓▓▓▓▓▓██░░░░░░██ \
\n──────────────────────────────██▓▓▓▓▓▓████████████░░░░██ \
\n────────────────────────────██▓▓▓▓▓▓████████████████░██  \
\n────────────────────────────██▓▓████░░░░░░░░░░░░██████   \
\n──────────────────────────████████░░░░░░██░░██░░██▓▓▓▓██ \
\n──────────────────────────██░░████░░░░░░██░░██░░██▓▓▓▓██ \
\n────────────────────────██░░░░██████░░░░░░░░░░░░░░██▓▓██ \
\n────────────────────────██░░░░░░██░░░░██░░░░░░░░░░██▓▓██ \
\n──────────────────────────██░░░░░░░░░███████░░░░██████   \
\n────────────────────────────████░░░░░░░███████████▓▓██   \
\n──────────────────────────────██████░░░░░░░░░░██▓▓▓▓██   \
\n────────────────────────────██▓▓▓▓██████████████▓▓██     \
\n──────────────────────────██▓▓▓▓▓▓▓▓████░░░░░░████       \
\n────────────────────────████▓▓▓▓▓▓▓▓██░░░░░░░░░░██       \
\n────────────────────────████▓▓▓▓▓▓▓▓██░░░░░░░░░░██       \
\n────────────────────────██████▓▓▓▓▓▓▓▓██░░░░░░████████   \
\n──────────────────────────██████▓▓▓▓▓▓████████████████   \
\n────────────────────────────██████████████████████▓▓▓▓██ \
\n──────────────────────────██▓▓▓▓████████████████▓▓▓▓▓▓██ \
\n────────────────────────████▓▓██████████████████▓▓▓▓▓▓██ \
\n────────────────────────██▓▓▓▓██████████████████▓▓▓▓▓▓██ \
\n────────────────────────██▓▓▓▓██████████──────██▓▓▓▓████ \
\n────────────────────────██▓▓▓▓████──────────────██████   \
\n──────────────────────────████                           \
\n\n" && $HOME/bin/tts it "Spicy Meetball" > /dev/null'
function make_func(){
	make ${@:1} && yee
}
function xdg_open(){
 xdg-open ${@:1}
}

function cd_func(){
	builtin cd ${@:1} && ls
}

function extract(){
	if [ -f $1 ]; then
		case $1 in
			*.tar.bz2)	tar xjf $1;;
			*.tar.gz)	tar xzf $1;;
			*.bz2)		bunzip2 $1;;
			*.rar)		unrar x $1;;
			*.gz)		gunzip $1;;
			*.tar)		tar xf $1;;
			*.tbz2)		tar xjf $1;;
			*.tgz)		tar xzf $1;;
			*.zip)		unzip $1;;
			*.Z)		uncompress $1;;
			*.7z)		7z x $1;;
			*) echo "'$1' Has an unknown file extension";;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

#mkdir and cd
mkcd () {
	case "$1" in
		*/..|*/../) cd -- "$1";;
		/*/../*) (cd "${1%/../*}/.." && mkdir -p "./${1##*/../}") && cd -- "$1";;
		/*) mkdir -p "$1" && cd "$1";;
		*/../*) (cd "./${1%/../*}/.." && mkdir -p "./${1##*/../}") && cd "./$1";;
		../*) (cd .. && mkdir -p "${1#.}") && cd "$1";;
		*) mkdir -p "./$1" && cd "./$1";;
	esac
}

alias extr="extract"
alias make="make_func"
alias fucking="sudo"
alias op="xdg_open"

# ETA Stuffs
export ETA_ENV_DIR=/home/rpash/classes/eecs442
start-eta() { source "${ETA_ENV_DIR}/bin/activate"; }
exit-eta() {
	case `command -v python` in
		${ETA_ENV_DIR}/*) deactivate;;
		*) builtin exit;;
	esac
}
