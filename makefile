index: images
	pandoc -o content/index.html -s --css common.css sources/index.md 

images:
	dot -Tsvg -ocontent/images/daemon-relationships.svg sources/daemon-relationships.dot
