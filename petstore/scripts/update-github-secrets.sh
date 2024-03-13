#!/bin/bash
SECRET="$1"
repoName="$2"

echo "SECRET: $SECRET || reponame: $repoName"

echo "Getting public key from repo: $repoName"
petstoreappJson=$(curl -L -H "Accept: application/vnd.github+json" -H "Authorization: Bearer $GITHUB_TOKEN" -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/repos/Denys-Valkovyi/$repoName/actions/secrets/public-key)

keyId=$(echo "${petstoreappJson}" | jq  '.["key_id"]')
key=$(echo "${petstoreappJson}" | jq  '.["key"]')
	
echo "JSON public-key endpoint: $petstoreappJson"
echo "Encrypting public key: $key and Secret: $SECRET"
encryptedSecret=$(python encrypt.py $key $SECRET)
echo "Encrypted secret: $encryptedSecret"

data=$( jq -n \
  --argjson ke "$keyId" \
  --arg en "$encryptedSecret" \
  '{"key_id": $ke, "encrypted_value": $en}' )

echo "Updating secret in repo: $repoName"
curl -L   -X PUT   -H "Accept: application/vnd.github+json"   -H "Authorization: Bearer $GITHUB_TOKEN"   -H "X-GitHub-Api-Version: 2022-11-28"   https://api.github.com/repos/Denys-Valkovyi/$repoName/actions/secrets/WEBAPPSECRET   -d "$data"