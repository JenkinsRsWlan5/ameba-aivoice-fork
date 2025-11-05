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

AIVOICE_LIB := -L./prebuilts/lib/ameba_linux -laivoice -lafe_kernel -lafe_res_2mic50mm -lkernel -lvad_v7_200K -lkws_xiaoqiangxiaoqiang_nihaoxiaoqiang_v4_300K -lasr_cn_v8_2M -lfst_cn_cmd_ac40 -lnnns_com_v7_35K -ltensorflow-lite -lNE10 -lcJSON -ltomlc99 -laivoice_hal
AIVOICE_INC := -I./include/

EXAMPLE_INC := -I./examples/full_flow_offline/platform/ameba_linux/
EXAMPLE_FLAG := -DUSE_BINARY_RESOURCE=0

all: $(O)/$(exe-y)

$(O)/$(exe-y):
	$(CC) $(CFLAGS) $(EXAMPLE_FLAG) $(EXAMPLE_INC) $(AIVOICE_INC) $(AIVOICE_LIB) $(LDFLAGS) examples/full_flow_offline/platform/ameba_linux/main.c examples/full_flow_offline/example_full_flow_offline.c examples/full_flow_offline/testwav_3c.c $(AIVOICE_LIB) -lstdc++ -lm -o $@

clean:
	-rm -f $(O)/*
