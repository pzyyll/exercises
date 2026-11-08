# Version 1.0
# Author Caizhili
# A simple c++ makefile template
#
# Version 2.0
# Author Caizhili
# Add suffix SRCSUFFIXS. Example ".cpp", ".cc".

TARGET = amsvr
CC = g++
CPPFLAGS = -std=c++11 -Wall -g3 -fPIC
LDFLAGS = -lboost_system -lboost_thread -lboost_serialization
SRC_SUFFIX = .cpp
SRC_DIRS = . ./common/ext/test/
INC_DIRS = . ./common/ext/test/

INCFLAGS := $(addprefix -I,$(INC_DIRS))
COMPILE.cc := $(CC) $(CPPFLAGS) $(LDFLAGS) $(INCFLAGS)

ABS_SRCDIRS := $(abspath $(SRC_DIRS))
ABS_INCDIRS := $(abspath $(INC_DIRS))

SRCS := $(foreach v,$(ABS_SRCDIRS),$(wildcard $(addprefix $(v)/*,$(SRC_SUFFIX))))
OBJS := $(SRCS:.cpp=.o)
DEPS := $(SRCS:.cpp=.d)

## TARGET
.PHONY : all
all : $(TARGET)

.PHONY : $(TARGET)
$(TARGET) : $(OBJS)
	@echo "Build target "$@
	@$(COMPILE.cc) $^ -o $@

PAT_WILDCARD = $(addprefix %,$(SRC_SUFFIX))
%.o : $(PAT_WILDCARD) %.d
	@echo "Compliling $@"
	@$(COMPILE.cc) -c $< -o $@

## DEPS
%.d : $(PAT_WILDCARD)
	@echo "Create "$@;
	@set -e; rm -f $@; \
	$(COMPILE.cc) -MT $*.d -MP -MM $< -MF $@;

sinclude $(DEPS)

.PHONY : clean
clean:
	@rm -rf $(DEPS) $(OBJS) $(TARGET)
