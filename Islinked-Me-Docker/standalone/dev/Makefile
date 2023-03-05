# ex. run: make build f=CoolEngineer-me-0.2-emb.war

.PHONY: build*

build:
	echo "Building $f..."
	sudo docker build . --build-arg file=$f -t islinked-me:dev

