#!/bin/bash

issueTime=$(date +%s)
expireTime=$(date -d "$expireTime + 600 seconds" +%s)
header=$(echo '{ "alg": "RS256", "typ": "JWT" }' | jq -r '(. | @base64)')
payload=$(echo '{"iss": '"${{secrets.APP_ID}}"',"iat": '$issueTime' ,"exp":'$expireTime'}'| jq -r '(. | @base64)'| sed s/\+/-/ | sed -E s/=+$//)
echo "${{secrets.APP_PRIVATE_KEY}}" > key
signature=$(echo -n "$header.$payload" | openssl dgst -sha256 -binary -sign key | openssl enc -base64 | tr -d '\n=' | tr -- '+/' '-_')
tokenURL=$(curl -i -X GET -H "Authorization: Bearer $header.$payload.$signature" -H "Accept: application/vnd.github.v3+json" https://api.github.com/app/installations | grep 'access_tokens_url' | awk '{print $2}' | sed -e 's/^"//' -e 's/",$//')
token=$(curl -i -X POST -H "Authorization: Bearer $header.$payload.$signature" -H "Accept: application/vnd.github.v3+json" $tokenURL | grep 'token'| awk '{print $2}' | sed -e 's/^"//' -e 's/",$//')
echo "GITHUB_TOKEN=$token" >> $GITHUB_ENV
