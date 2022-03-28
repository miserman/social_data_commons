#!/bin/bash
script_dir="$(dirname "$(realpath "$0")")"
repos_dir="$(dirname "$script_dir")/repos/"
while read repo
do
  repo_path="$repos_dir""$(basename "$repo")"
  if [[ -d "$repo_path" ]]
  then
    echo "pulling "$repo""
    cd "$repo_path"
    git pull
    cd "$script_dir"
  else
    echo "cloning "$repo""
    git clone git@github.com:$repo.git
  fi
done < ""$(dirname "$0")"/repos.txt"

