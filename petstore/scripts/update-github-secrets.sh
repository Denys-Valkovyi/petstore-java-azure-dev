#!/bin/bash
SECRET="$1"

#https://github.com/Denys-Valkovyi/petstoreapp
curl -L \
  -X PUT \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer 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" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repositories/762231897/environments/main/secrets/PETAPPSECRET \ 
  -d '{"encrypted_value":"$SECRET","key_id":"012345678912345678"}'