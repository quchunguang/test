CPP = g++
CFLAGS = -Wall -Ofast -mfpu=vfp -mfloat-abi=hard -march=armv6zk -mtune=arm1176jzf-s -lrf24-bcm

all: rf_recv

rf_recv: rf_recv.cpp
	$(CPP) $(CFLUGS) -o $@ $<
