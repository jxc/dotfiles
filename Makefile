# Find all .sh files and shell scripts in bin/ (excluding Ruby scripts)
SHELL_FILES := $(wildcard */*.sh) $(wildcard script/*)
BIN_SCRIPTS := $(filter-out bin/git-wtf, $(wildcard bin/*))

.PHONY: lint
lint:
	shellcheck $(SHELL_FILES) $(BIN_SCRIPTS)
