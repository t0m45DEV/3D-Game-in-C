#!/bin/bash

IMG_PARSER_CODE="./imageParser/imageParser.c"
IMG_PARSER="image_parser"

TEXTURE_IMG="./images/textures.png"
TEXTURE_HEADER_DEST="./inc/all_textures.h"
TEXTURE_CODE_DEST="./src/all_textures.c"

TEXTURE_SIZE_NAME="TEXTURE_SIZE"
TEXTURE_MATRIX_NAME="ALL_TEXTURES"

NC='\033[0m' # No Color
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'

# To print my shit
message() {
    COLOR=$1
    echo -e "${COLOR}>> $2 ${NC}"
}

message ${GREEN} "Welcome to the Tom's 3D engine instalation process!"

message ${NC} "Parsing textures..."
gcc ${IMG_PARSER_CODE} -o ${IMG_PARSER} -lm

if [ $? -ne 0 ]; then
	message ${RED} "There was an error compiling the image parser!"
	exit 1
fi

./${IMG_PARSER} ${TEXTURE_IMG} ${TEXTURE_HEADER_DEST} ${TEXTURE_CODE_DEST} ${TEXTURE_SIZE_NAME} ${TEXTURE_MATRIX_NAME}
rm ${IMG_PARSER}
message ${CYAN} "All textures had been succesfully added!"

message ${NC} "Creating build folder..."
mkdir -p build
message ${CYAN} "Build folder created!"
cd build

message ${NC} "Running CMake..."
cmake ..

if [ $? -ne 0 ]; then
	message ${RED} "There was an error running CMake!"
	exit 1
fi

message ${CYAN} "CMake succesfully did all it's stuff!"

message ${NC} "Creating executable..."
make all

if [ $? -ne 0 ]; then
	message ${RED} "There was an error compiling the project!"
	exit 1
fi

message ${GREEN} "Executable created!"

message ${CYAN} "Check the build folder, there's the game executable"
message ${GREEN} "Have fun!"

exit 0
