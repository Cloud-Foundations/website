#MacOS requires different flags for sed
SED_FLAGS = -i 

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
        SED_FLAGS = -i ''
endif

ifeq ($(TARGET_DIR),)
	TARGET_DIR := content
endif

all: index images css

index: images css
	pandoc -o ${TARGET_DIR}/index.html -s --css common.css sources/index.md
	cp convert.py ${TARGET_DIR}	
	cd ${TARGET_DIR} && python convert.py index.html
	sed ${SED_FLAGS} 's/svg width=.*/svg/g' ${TARGET_DIR}/index.html
	rm ${TARGET_DIR}/convert.py

css:
	mkdir -p ${TARGET_DIR}/
	cp sources/common.css ${TARGET_DIR}/

images:
	mkdir -p ${TARGET_DIR}/images/
	dot -Tsvg -o${TARGET_DIR}/images/daemon-relationships.svg sources/daemon-relationships.dot
clean:
	rm -rf ${TARGET_DIR}/*


