#!/bin/sh

q3make() {
	# linux need gcc-multilib
	# ubuntu depends freetype: libfreetype6-dev libpng12-dev
	export ARCH=x86_64
	exec make \
	BUILD_STANDALONE=0 \
	BUILD_CLIENT=1 \
	BUILD_SERVER=0 \
	BUILD_GAME_SO=0 \
	BUILD_GAME_QVM=0 \
	BUILD_BASEGAME=0 \
	BUILD_MISSIONPACK=0 \
	BUILD_RENDERER_OPENGL2=1 \
	\
	USE_OPENAL=1 \
	USE_OPENAL_DLOPEN=1 \
	USE_CURL=0 \
	USE_CODEC_VORBIS=0 \
	USE_CODEC_OPUS=0 \
	USE_MUMBLE=0 \
	USE_VOIP=0 \
	USE_FREETYPE=1 \
	USE_INTERNAL_LIBS=1 \
	\
	"$@"
}

eof() {
	wait # waits for all background processes to complete
	echo "= $(date) = end =";
}

build() {
	q3make &
	eof
}

build

