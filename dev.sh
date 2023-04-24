if [ $# -eq 0 ]; then
	echo "usage:"
	echo "  ./dev.sh [up|down] [service1] [service2] ..."
	exit
fi

params=()

if [ $1 == "up" ]; then
	params+=("--build")
fi

docker-compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.dev.yml $1 ${params[*]} ${@:2}
