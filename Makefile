build_image:
	docker build -t scanpy_test .

run_image:
	docker run -p 8888:8888 -it --name scanpy_test scanpy_test