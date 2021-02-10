#!/bin/bash
# shellcheck disable=SC1091

GITHUB_REPOSITORY=$1
GITHUB_RUN_ID=$2

checkSuiteID=`curl -s https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/runs/"$GITHUB_RUN_ID" | jq -r '.check_suite_id'`

e2eStatus=$(curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/check-suites/"$checkSuiteID"/check-runs | grep -B 15 'e2e (2)' | grep 'conclusion' | awk '{print $2}')
echo e2e "$e2eStatus"

while [ -z "$e2eStatus" ]; do
    e2eStatus=$(curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/check-suites/"$checkSuiteID"/check-runs | grep -B 15 'e2e (2)' | grep 'conclusion' | awk '{print $2}')
    echo e2eStatus "$e2eStatus"
done

countNumStatusFail=$(curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/check_suites/"$checkSuiteID"/check-runs | grep 'conclusion' | grep -c 'failure')
echo countNumStatusFail "$countNumStatusFail"

if [ "$countNumStatusFail" -gt 0 ]; then
    echo "$countNumStatusFail Status Checks Failed "
    exit 1
fi
