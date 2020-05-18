index: images
	pandoc -o content/index.html -s --css common.css sources/index.md
	cd content && python ../convert.py index.html	

images:
	dot -Tsvg -ocontent/images/daemon-relationships.svg sources/daemon-relationships.dot
