#!/bin/bash
# shellcheck disable=SC1091


GITHUB_REPOSITORY=$1
prNumber=$2
ref = $3
GITHUB_RUN_ID=$4

rebaseable=$(curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/pulls/"$prNumber" | grep -w rebaseable | awk '{print $2}' | sed -e 's/,//g')
workflowID=$(curl -s https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/runs/"$GITHUB_RUN_ID" | jq -r '.workflow_id')
if [ "$rebaseable" == "true" ]; then
    curl -X POST -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/workflows/"$workflowID"/dispatches -d '{"ref":"'$ref'", "inputs": {"name": "Re-run status checks"}}'
fi