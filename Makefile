.PHONY: test-bash already-testing

ifneq ($(TTPPD_TEST),1)
.ONESHELL:
test-bash:
	export TTPPD_TEST=1
	bash --rcfile testing.sh -i
else
.ONESHELL:
already-testing:
	@echo ""
	@echo ""
	@echo "Already testing."
	@echo "type "exit" or press CTRL+D to return to your normal terminal"
	@echo ""
	@echo ""
endif
