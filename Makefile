index: images
	pandoc -o content/index.html -s --css common.css sources/index.md 

css:
	mkdir -p content/
	cp content/common.css content/

images:
	mkdir -p content/images/
	dot -Tsvg -ocontent/images/daemon-relationships.svg sources/daemon-relationships.dot
