# changelog-805-test

A test of a per-PR changelog check with [chloggen](https://github.com/open-telemetry/opentelemetry-go-build-tools/tree/main/chloggen):

- Each user-facing PR adds a YAML entry in `.chloggen/`. The `changelog` workflow fails the PR without one, unless it has the `skip-changelog` label.
- The `prereleaser` workflow runs `make chlog-update`, which writes the new section into CHANGELOG.md.
- The `releaser` workflow runs on a version tag and puts that section into the GitHub release notes.
