
#MacOS requires different flags for sed
SED_FLAGS = -i 

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
        SED_FLAGS = -i ''
endif


index: images
	pandoc -o content/index.html -s --css common.css sources/index.md
	cd content && python ../convert.py index.html
	sed ${SED_FLAGS} 's/svg width=.*/svg/g' content/index.html 	

images:
	dot -Tsvg -ocontent/images/daemon-relationships.svg sources/daemon-relationships.dot
