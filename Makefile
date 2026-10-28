CHLOGGEN_CONFIG := .chloggen/config.yaml
FILENAME ?= $(shell git branch --show-current)
# Repos without a go.mod: CHLOGGEN := go run go.opentelemetry.io/build-tools/chloggen@v0.30.0
CHLOGGEN ?= go tool chloggen

.PHONY: chlog-new chlog-validate chlog-preview chlog-update
chlog-new:
	$(CHLOGGEN) new --config $(CHLOGGEN_CONFIG) --filename $(FILENAME)

chlog-validate:
	$(CHLOGGEN) validate --config $(CHLOGGEN_CONFIG)

chlog-preview:
	$(CHLOGGEN) update --config $(CHLOGGEN_CONFIG) --dry

chlog-update:
	$(CHLOGGEN) update --config $(CHLOGGEN_CONFIG) --version $(VERSION)
