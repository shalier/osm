#!/bin/bash
# shellcheck disable=SC1091

GITHUB_REPOSITORY=$1

while true; do
    status=$(curl -s -i -X GET -H "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/$GITHUB_REPOSITORY/actions/runs" | grep -A 15 workflow_runs | grep status | awk '{print $2}' | sed -e 's/^"//' -e 's/",$//')
    if [ "$status" == "completed" ]; then
        conclusion=$(curl -s -i -X GET -H "Accept: application/vnd.github.v3+json" "https://api.github.com/repos/$GITHUB_REPOSITORY/actions/runs" | grep -A 15 workflow_runs | grep conclusion | awk '{print $2}' | sed -e 's/^"//' -e 's/",$//');
        if [ $conclusion == "success" ]; then
            echo 'All status checks passed';
            break;
        else exit 1;
        fi;
    fi;
done
# GITHUB_RUN_ID=$2

# checkSuiteID=$(curl -s https://api.github.com/repos/"$GITHUB_REPOSITORY"/actions/runs/"$GITHUB_RUN_ID" | jq -r '.check_suite_id')

# headSHA=$(curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/check-suites/"$checkSuiteID"/check-runs | grep head_sha| awk '{print $2}'| sed -e 's/^"//' -e 's/",$//')

# sleep 15m
# while [[ "$e2eStatus" != success && "$e2eStatus" != failure ]]; do
#     e2eStatus=$(curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/commits/"$headSHA"/check-runs | grep -B 15 'e2e (2)' | grep 'conclusion' | awk '{print $2}' | sed 's/[^[:alnum:]]\+//g')
# done

# countNumStatusFail=$(curl -i -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$GITHUB_REPOSITORY"/commits/"$headSHA"/check-runs | grep 'conclusion' | grep -c 'failure')
# echo countNumStatusFail "$countNumStatusFail"

# if [ "$countNumStatusFail" -gt 0 ]; then
#     echo "$countNumStatusFail Status Checks Failed "
#     exit 1
# fi

        # temp=$(curl -s -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/shalier/osm/actions/runs | grep -A 15 workflow_runs )
        # status=$(curl -s -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/shalier/osm/actions/runs | grep -A 15 workflow_runs | grep status | awk '{print $2}' | sed -e 's/^"//' -e 's/",$//')
        # conclusion=$(curl -s -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/shalier/osm/actions/runs | grep -A 15 workflow_runs | grep conclusion | awk '{print $2}' | sed -e 's/^"//' -e 's/",$//')
        # if [[ $status == completed ]]; then if [[ $conclusion != success ]]; then exit 1; else echo 'Status checks successfully completed'; fi; fi