#!/bin/bash
# shellcheck disable=SC1091

GITHUB_REPOSITORY=$1
GITHUB_RUN_ID=$2

suiteID=$(curl -s https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/runs/"$GITHUB_RUN_ID" | jq -r '.check_suite_id')
headSHA=$(curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/check-suites/"$suiteID"/check-runs | grep head_sha| awk '{print $2}'| sed -e 's/^"//' -e 's/",$//')

curl -s -i -X GET -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/runs | grep -B6 -A1 '"status":' | grep -B3 -A4 "$headSHA" | grep name | awk '{print $2}' | grep -v automerge | sed -e 's/^"//' -e 's/",$//' | while read -r workflowName; do
    while true; do
        status=$(curl -s -i -X GET -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/runs | grep -B6 -A1 '"status":' | grep -B3 -A4 "$headSHA" | grep -B5 -A3 "pull_request" | grep -A7 -m1 "$workflowName" | grep "status" | awk '{print $2}' | sed -e 's/^"//' -e 's/",$//')
            if [ "$status" == "completed" ]; then
                echo 'Check completed, checking conclusion'
                conclusion=$(curl -s -i -X GET -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/runs | grep -B6 -A1 '"status":' | grep -B3 -A4 "$headSHA" | grep -B5 -A3 "pull_request" | grep -A7 -m1 "$workflowName"|grep "conclusion"| awk '{print $2}' | sed -e 's/^"//' -e 's/",$//')
                if [ "$conclusion" != "success" ]; then
                    echo 'Not all status checks were successful'
                    exit 1
                else
                    echo "$workflowName" workflow has completed successfully
                    break
                fi
            fi
        sleep 100
    done
done

echo 'All status checks passed'