#!/bin/bash
# Mirrors primus src/sh/releaser.sh gh_pr_signoz() with the TDD change applied.
set -euo pipefail
signoz_version="$1"; remote_origin="${2:-origin}"
branch_name="release/${signoz_version}"
git checkout -b "${branch_name}"
# Collect the .chloggen entries into CHANGELOG.md and delete them.
make chlog-update VERSION="${signoz_version}"
git add -A .chloggen CHANGELOG.md
git commit -am "chore(release): bump to ${signoz_version}"
git push "${remote_origin}" "${branch_name}"
RELEASE_PR_BODY=$(echo -e "#### Summary\n - Release SigNoz ${signoz_version}\n\n Created by [Primus-Bot](https://github.com/apps/primus-bot)\n\n")
RELEASE_PR_TITLE=$(echo -e "chore(release): bump SigNoz to ${signoz_version}")
gh pr create -B main -H "${branch_name}" --title "${RELEASE_PR_TITLE}" --body "${RELEASE_PR_BODY}" --label skip-changelog
