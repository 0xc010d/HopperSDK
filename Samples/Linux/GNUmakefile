include $(GNUSTEP_MAKEFILES)/common.make

COMMON_OBJC_FLAGS = -I../../include -DLINUX -Wno-format -fblocks -fobjc-nonfragile-abi -fobjc-arc

BUNDLE_NAME = AmigaLoader SampleTool M68kCPU

AmigaLoader_OBJC_FILES = ../AmigaLoader/AmigaLoader/AmigaLoader.m
AmigaLoader_OBJCFLAGS=$(COMMON_OBJC_FLAGS)

SampleTool_OBJC_FILES = ../SampleTool/SampleTool/SampleTool.m
SampleTool_OBJCFLAGS=$(COMMON_OBJC_FLAGS)

M68kCPU_OBJC_FILES = ../M68kCPU/M68kCPU/M68kCPU.m ../M68kCPU/M68kCPU/M68kCtx.m
M68kCPU_C_FILES = \
	../M68kCPU/M68kCPU/Capstone/arch/M68K/M68KModule.c \
	../M68kCPU/M68kCPU/Capstone/arch/M68K/M68KDisassembler.c \
	../M68kCPU/M68kCPU/Capstone/arch/M68K/M68KInstPrinter.c \
	../M68kCPU/M68kCPU/Capstone/MCRegisterInfo.c \
	../M68kCPU/M68kCPU/Capstone/MCInst.c \
	../M68kCPU/M68kCPU/Capstone/MCInstrDesc.c \
	../M68kCPU/M68kCPU/Capstone/cs.c \
	../M68kCPU/M68kCPU/Capstone/SStream.c \
	../M68kCPU/M68kCPU/Capstone/utils.c

M68kCPU_CFLAGS = -DCAPSTONE_USE_SYS_DYN_MEM -DCAPSTONE_HAS_M68K -I../M68kCPU/M68kCPU/Capstone/include
M68kCPU_OBJCFLAGS = -I../M68kCPU/M68kCPU/Capstone/include $(COMMON_OBJC_FLAGS)

include $(GNUSTEP_MAKEFILES)/bundle.make