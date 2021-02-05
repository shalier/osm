#!/bin/bash
#shellcheck disable=SC2154
#shellcheck disable=SC2016
#shellcheck disable=SC2086

ID=$1
PK=$2

issueTime=$(date +%s)
expireTime=$(date -d "$expireTime + 600 seconds" +%s)

# Creates JSON Webtoken (JWT)
header=$(echo '{ "alg": "RS256", "typ": "JWT" }' | jq -r '(. | @base64)')
payload=$(echo '{"iss": '"$ID"',"iat": '$issueTime' ,"exp": '$expireTime'}'| jq -r '(. | @base64)'| sed s/\+/-/ | sed -E s/=+$//)
echo "$PK" > key
signature=$(echo -n "$header.$payload" | openssl dgst -sha256 -binary -sign key | openssl enc -base64 | tr -d '\n=' | tr -- '+/' '-_')

# Uses JWT to get Installation Access Token (IAT)
tokenURL=$(curl -i -X GET -H "Authorization: Bearer $header.$payload.$signature" -H "Accept: application/vnd.github.v3+json" https://api.github.com/app/installations | grep 'access_tokens_url' | awk '{print $2}' | sed -e 's/^"//' -e 's/",$//')
token=$(curl -i -X POST -H "Authorization: Bearer $header.$payload.$signature" -H "Accept: application/vnd.github.v3+json" "$tokenURL" | grep 'token'| awk '{print $2}' | sed -e 's/^"//' -e 's/",$//')

echo "GITHUB_TOKEN=$token" >> "$GITHUB_ENV"
