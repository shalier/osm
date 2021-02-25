#!/bin/bash
# shellcheck disable=SC1091
# shellcheck disable=SC2086

GITHUB_REPOSITORY=$1
PR_NUM=$2
REF=$3
GITHUB_RUN_ID=$4

rebaseable=$(curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/pulls/"$PR_NUM" | grep -w rebaseable | awk '{print $2}' | sed -e 's/,//g')
workflowID=$(curl -s https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/runs/"$GITHUB_RUN_ID" | jq -r '.workflow_id')
if [ "$rebaseable" == "true" ]; then
    curl -X POST -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/workflows/"$workflowID"/dispatches -d '{"ref":"'$REF'", "inputs": {"name": "Re-run status checks"}}'
fi
suiteID=$(curl -s https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/runs/"$GITHUB_RUN_ID" | jq -r '.check_suite_id')
echo check_run "$suiteID"
curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/check-suites/"$suiteID"/check-runs
echo ""
echo check_run_run_id "$GITHUB_RUN_ID"
curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/check-runs/"$GITHUB_RUN_ID"
