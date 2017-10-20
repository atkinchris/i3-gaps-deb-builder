build:
	docker build -t builder .
	docker run --rm -v `pwd`/output:/output builder
