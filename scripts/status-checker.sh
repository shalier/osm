#!/bin/bash
# shellcheck disable=SC1091

GITHUB_REPOSITORY=$1
GITHUB_RUN_ID=$2

checkSuiteID=$(curl -s https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/runs/"$GITHUB_RUN_ID" | jq -r '.check_suite_id')
headSHA=$(curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/check-suites/"$checkSuiteID"/check-runs | grep head_sha| awk '{print $2}'| sed -e 's/^"//' -e 's/",$//')

curl -s -i -X GET -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/runs | grep -B6 -A1 '"status":' | grep -B3 -A4 "$headSHA" | grep name | awk '{print $2}' | grep -v automerge | sed -e 's/^"//' -e 's/",$//' | while read -r check; do
    while true; do
        status=$(curl -s -i -X GET -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/runs | grep -B6 -A1 '"status":' | grep -B3 -A4 "$headSHA" | grep -A7 "$check" | grep "status" | awk '{print $2}' | sed -e 's/^"//' -e 's/",$//')
            if [ "$status" == "completed" ]; then
                echo 'Check completed, checking conclusion'
                conclusion=$(curl -s -i -X GET -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/runs | grep -B6 -A1 '"status":' | grep -B3 -A4 "$headSHA" | grep -A7 "$check" |grep "conclusion"| awk '{print $2}' | sed -e 's/^"//' -e 's/",$//')
                if [ "$conclusion" != "success" ]; then
                    echo 'Not all status checks passed'
                    exit 1
                else
                    echo "$check" workflow has completed successfully
                    break
                fi
            fi
        sleep 100
        # treeID=$(curl -s -i -X GET -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/runs | grep -A1 "$headSHA" | grep tree_id | awk '{print $2}' | sed -e 's/^"//' -e 's/",$//' | sort --unique)
        # echo "$treeID"
        # checkIfRebased=$(curl -s -i -X GET -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/runs | grep -A4 "$treeID" | grep "automergetest\[bot\]" | awk '{print $2}' | sed -e 's/^"//' -e 's/",$//')
        # if [  "$checkIfRebased" == "automergetest\[bot\]" ]; then
        #     echo Ending this job as PR has been rebased
        #     exit 1
        # fi
    done
done

echo 'All status checks passed'
