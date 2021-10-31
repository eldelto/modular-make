BUILD_DIR := ./build
ARTIFACT_NAME := main

MODULES := ./src \
					./src/payment-api

SRC_FILES := $(shell find $(MODULES) -name '*.c' -maxdepth 1)
OBJ_FILES := $(SRC_FILES:.c=.o)
DEPENDENCY_FILES := $(OBJ_FILES:.o=.d)

#include $(patsubst %, %/module.mk,$(MODULES))

CC := gcc
CFLAGS  := -Wall -Werror -Wextra -pedantic-errors -ansi -std=c17 -MMD -MP

$(BUILD_DIR)/$(ARTIFACT_NAME): $(OBJ_FILES)
	$(CC) $(OBJ_FILES) -o $@ $(LDFLAGS)

%.o: %.c Makefile
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	find . -name '*.o' | xargs rm
	find . -name '*.d' | xargs rm
	rm $(BUILD_DIR)/$(ARTIFACT_NAME)
.PHONY: clean

-include $(DEPENDENCY_FILES) 
