CXX := g++
CXXFLAGS := -Wall -std=c++11
LDFLAGS :=

DEBUG := false

# make DEBUG=true emits debug info
ifeq ($(DEBUG),true)
	CXXFLAGS := $(CXXFLAGS) -g
endif

# used for filename of output program
NAME := mk_practice

MKF_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MKF_DIR := $(patsubst %/,%,$(dir $(MKF_PATH))) # dir leaves a trailing /
MKF_DIR := $(strip $(MKF_DIR))

# absolute paths to dirs
BIN := $(MKF_DIR)/bin
OBJ := $(MKF_DIR)/obj
SRC := $(MKF_DIR)/src

HEADERS := non_trivial_class.h
H_PATHS := $(HEADERS:%=$(SRC)/%)

SOURCES := main.cpp non_trivial_class.cpp
S_PATHS := $(SOURCES:%=$(SRC)/%)

OBJECTS := $(SOURCES:.cpp=.o)
O_PATHS := $(OBJECTS:%=$(OBJ)/%)

# path to output lib/exe
OUTPUT := $(BIN)/$(NAME)

# General rules:
#
# - Whenever an .o file changes, the resulting executable/library should be updated.
# - Whenever a .cpp file changes, its corresponding .o file should be updated.
# - Whenever an .h file changes, all .o files should be updated.

.PHONY: all print-%

all: $(OUTPUT)

# useful for debugging
# usage: print-VARNAME
print-%:
	@echo $*=$($*) # $* matches the stem of a pattern rule

$(BIN):
	@mkdir -p $@

$(O_PATHS): $(OBJ)/%.o: $(SRC)/%.cpp $(H_PATHS) | $(OBJ)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(OBJ):
	@mkdir -p $@

$(OUTPUT): $(O_PATHS) | $(BIN)
	$(CXX) $(LDFLAGS) -o $@ $(O_PATHS)
