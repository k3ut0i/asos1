AS = nasm
ASFLAGS = -Wall -f bin -Isrc

SRCS = $(wildcard src/*.s)
OBJS = $(patsubst %.s, %.o, $(SRCS))

#DEPS = $(patsubst %.s, %.d, $(SRCS))
# deps.d : $(SRCS)
# 	for f in $(SRCS) do \
# 	  nasm -MF $@ $f \
# 	done
#-include deps.d

ifdef DEBUG
ASFLAGS += -DDEBUG
endif

.PHONY : all clean

all : $(OBJS)

clean :
	rm -f $(OBJS) $(DEPS)
