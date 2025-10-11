#
# Realtek Semiconductor Corp.
#

CROSS_COMPILE ?= arm-linux-

CC := $(CROSS_COMPILE)gcc
CXX := $(CROSS_COMPILE)g++
LD := $(CROSS_COMPILE)gcc
AR := $(CROSS_COMPILE)ar
RANLIB := $(CROSS_COMPILE)ranlib
O ?= $(shell pwd)

exe-y = rtk_aivoice_algo

EXAMPLE_INC := -I./examples/full_flow_offline/platform/ameba_linux/

all: $(O)/$(exe-y)

$(O)/$(exe-y):
	$(CC) $(CFLAGS) $(EXAMPLE_INC) $(LIBAIVOICE_INC) $(LIBAIVOICE_LIB) $(LDFLAGS) examples/full_flow_offline/platform/ameba_linux/main.c examples/full_flow_offline/example_full_flow_offline.c examples/full_flow_offline/testwav_3c.c $(LIBAIVOICE_LIB) -lstdc++ -lm -o $@

clean:
	-rm -f $(O)/*
