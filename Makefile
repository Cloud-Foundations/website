#MacOS requires different flags for sed
SED_FLAGS = -i 

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
        SED_FLAGS = -i ''
endif

ifeq ($(TARGET_DIR),)
	TARGET_DIR := content
endif

all: copy-compile index

copy-compile:
	mkdir -p ${TARGET_DIR}
	./build/copy-compile ${TARGET_DIR}

fresh: clean all

index: copy-compile
	cp build/convert.py ${TARGET_DIR}	
	cd ${TARGET_DIR} && python convert.py index.html
	sed ${SED_FLAGS} 's/svg width=.*/svg/g' ${TARGET_DIR}/index.html
	rm ${TARGET_DIR}/convert.py

clean:
	rm -rf ${TARGET_DIR}/*


