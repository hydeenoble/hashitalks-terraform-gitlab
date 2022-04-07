#!/bin/bash

curl -g -H "PRIVATE-TOKEN: ${GITLAB_TOKEN}" "${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/merge_requests/${CI_MERGE_REQUEST_IID}/notes" > notes.json

for k in $(jq '. | keys | .[]' notes.json); do
    discussions=$(jq -r .[$k] notes.json);
    username=$(jq '.author.username' <<< "$discussions" | jq -r .);
    note_id=$(jq '.id' <<< "$discussions" | jq -r .);
    type=$(jq '.type' <<< "$discussions" | jq -r .);
    
    if [ $username == 'idowu.emehinola' ] && [ $type == 'DiscussionNote' ]
    then
        curl --request DELETE --header "PRIVATE-TOKEN: ${GITLAB_TOKEN}" "${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/merge_requests/${CI_MERGE_REQUEST_IID}/notes/$note_id"
    fi
done