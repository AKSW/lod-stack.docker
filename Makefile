build:
	docker build -t lod-stack .

shell:
	docker run -i -t --rm -p 80:80 -p 8890:8890 lod-stack /usr/bin/byobu

run:
	docker run -i -t --rm -p 80:80 -p 8890:8890 lod-stack

