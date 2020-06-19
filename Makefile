AS = nasm
ASFLAGS = -Wall -f bin -Isrc
SRCDIR = src
TESTDIR = t
#SRCS = $(wildcard src/*.s src/*/*.s)
BIN_OBJS = t/test_hex.o
DEPS = $(patsubst %.o,%.d, $(BIN_OBJS))

%.d : %.s
	$(AS) $(ASFLAGS) -M -MF $@ $< -o $(patsubst %.s, %.o, $<)
%.o : %.s
	$(AS) $(ASFLAGS) -o $@ $<
include $(DEPS)

ifdef DEBUG
ASFLAGS += -DDEBUG
endif

.PHONY : all clean
all: $(BIN_OBJS)

clean :
	rm -f $(OBJS) $(DEPS) $(BIN_OBJS)
