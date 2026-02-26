# Find all .sh files and shell scripts in bin/ (excluding Ruby scripts)
SHELL_FILES := $(wildcard */*.sh) $(wildcard script/*)
BIN_SCRIPTS := $(filter-out bin/git-wtf, $(wildcard bin/*))

.PHONY: lint verify vm-setup vm-test vm-shell vm-ready vm-cleanup
lint:
	shellcheck $(SHELL_FILES) $(BIN_SCRIPTS)

verify:
	./script/verify

vm-setup:
	./script/test-vm setup

vm-test:
	./script/test-vm test

vm-shell:
	-./script/test-vm shell

vm-ready:
	-./script/test-vm ready

vm-cleanup:
	./script/test-vm cleanup
