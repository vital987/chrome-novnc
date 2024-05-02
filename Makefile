USR=vital987
NAME=chrome-novnc
TAG=latest
IMG=${USR}/${NAME}:${TAG}

build: clean
	docker build --tag ${IMG} --no-cache .

up:
	docker-compose up

down:
	docker-compose down

clean:
	docker stop ${IMG} 2>/dev/null || :
	docker rm ${IMG} 2>/dev/null || :
	docker rmi ${IMG} 2>/dev/null || :
