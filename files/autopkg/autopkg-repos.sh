#!/bin/bash

repo_list="/Users/grahamgilbert/Dropbox/src/Mine/autopkg-overrides/repolist.txt"

function update_repos {
    while IFS= read -r line
    do
        /usr/local/bin/autopkg repo-add $line
    done < $repo_list
}

update_repos