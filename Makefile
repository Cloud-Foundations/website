index: images
	pandoc -o content/index.html -s --css common.css sources/index.md 

images:
	mkdir -p content/images/
	dot -Tsvg -ocontent/images/daemon-relationships.svg sources/daemon-relationships.dot
