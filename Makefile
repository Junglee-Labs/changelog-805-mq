CHLOGGEN_CONFIG := .chloggen/config.yaml
FILENAME ?= $(shell git branch --show-current)

.PHONY: chlog-new chlog-validate chlog-preview chlog-update
chlog-new:
	go tool chloggen new --config $(CHLOGGEN_CONFIG) --filename $(FILENAME)

chlog-validate:
	go tool chloggen validate --config $(CHLOGGEN_CONFIG)

chlog-preview:
	go tool chloggen update --config $(CHLOGGEN_CONFIG) --dry

chlog-update:
	go tool chloggen update --config $(CHLOGGEN_CONFIG) --version $(VERSION)
