#!/bin/bash
# shellcheck disable=SC1091

GITHUB_REPOSITORY=$1
GITHUB_RUN_ID=$2

checkSuiteID=$(curl -s https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/runs/"$GITHUB_RUN_ID" | jq -r '.check_suite_id')
headSHA=$(curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/check-suites/"$checkSuiteID"/check-runs | grep head_sha| awk '{print $2}'| sed -e 's/^"//' -e 's/",$//')
while true; do
    status=$(curl -s -i -X GET -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/runs | grep -B6 -A1 '"status":' | grep -B3 -A4 "$headSHA" | grep -A7 "Go" | grep "status" | awk '{print $2}' | sed -e 's/^"//' -e 's/",$//')
    if [ "$status" == "completed" ]; then
        conclusion=$(curl -s -i -X GET -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/runs | grep -B6 -A1 '"status":' | grep -B3 -A4 "$headSHA" | grep -A7 "Go" |grep "conclusion"| awk '{print $2}' | sed -e 's/^"//' -e 's/",$//')
        if [ "$conclusion" == "success" ]; then
            echo 'All status checks passed'
            break
        else
            echo 'Not all status checks passed'
            exit 1
        fi
    fi
done
