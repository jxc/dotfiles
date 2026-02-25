# Find all .sh files and shell scripts in bin/ (excluding Ruby scripts)
SHELL_FILES := $(wildcard */*.sh) $(wildcard script/*)
BIN_SCRIPTS := $(filter-out bin/git-wtf, $(wildcard bin/*))

.PHONY: lint vm-setup vm-test vm-shell
lint:
	shellcheck $(SHELL_FILES) $(BIN_SCRIPTS)

vm-setup:
	./script/test-vm setup

vm-test:
	./script/test-vm test

vm-shell:
	-./script/test-vm shell
