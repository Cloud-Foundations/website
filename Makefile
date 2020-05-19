
ifeq ($(TARGET_DIR),)
	TARGET_DIR := content
endif

all: index images css

index: images css
	pandoc -o ${TARGET_DIR}/index.html -s --css common.css sources/index.md 

css:
	mkdir -p ${TARGET_DIR}/
	cp sources/common.css ${TARGET_DIR}/

images:
	mkdir -p ${TARGET_DIR}/images/
	dot -Tsvg -o${TARGET_DIR}/images/daemon-relationships.svg sources/daemon-relationships.dot
clean:
	rm -rf ${TARGET_DIR}/*
