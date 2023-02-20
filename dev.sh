prefixwith() {
    local prefix="$1"
    shift
    "$@" > >(sed "s/^/$prefix: /") 2> >(sed "s/^/$prefix (err): /" >&2)
}

gateway="mvn -f ./gateway clean spring-boot:run"

society="mvn -f ./society-svc clean spring-boot:run"

security="mvn -f ./security-svc clean spring-boot:run"

run() {
  if declare -f "$1" > /dev/null
  then
    prefixwith $1 "$1"
  fi
}

if [ $# -eq 0 ] 
then
  echo "usage:" 
  echo "  ./dev.sh [service]"
  echo "  ./dev.sh --tmux [service1] [service2] ..."
  echo "services: gateway, society, security"
  exit
fi

if [ "$1" == "--tmux" ]
then
  tmux new-session -d
  tmux rename dev
  for svc in "${@:2}"
  do
    tmux new-window -n $svc
    tmux send-keys "${!svc}" C-m
  done
  tmux a
  exit
fi

run $1

