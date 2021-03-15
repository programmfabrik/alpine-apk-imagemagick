docker_image_name = alpine-build-imagemagick
container_name = alpine-build-imagemagick
output_dir = ./output

clean:
	rm -rf ./output

mkdir: clean
	mkdir -p $(output_dir) && chmod a+rwx $(output_dir)

build: mkdir
	docker build --no-cache -t $(docker_image_name) -f Dockerfile .

run: build
	docker run --name $(container_name) -d $(docker_image_name)

copy: run
	docker cp $(container_name):/home/dev/packages/x86_64 $(output_dir)

shutdown: copy
	docker stop $(container_name)
	docker rm $(container_name)

package: shutdown
	tar -czvf $(output_dir)/imagemagick.tar.gz $(output_dir)/x86_64/*

all: package