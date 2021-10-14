#!/bin/bash
git_username_from=""
git_username_to=""
repo_branch=""
gitpod="yes/no"
while read -r repo_name; do
    git clone https://github.com/$git_username_from/$repo_name
    gh repo create $git_username_to/$repo_name --private -y
    cd $repo_name
    git remote rm origin
    if [ $gitpod == "yes" ]
    then
        git remote add origin https://github.com/$git_username_to/$repo_name
    else
        git remote add origin git@github.com:$git_username_to/$repo_name
    fi
    git checkout -b $repo_branch
    if [ $repo_name == "android_frameworks_base" ]
    then
        git push -u origin HEAD~50000:refs/heads/$repo_branch
        git push -u origin HEAD~40000:refs/heads/$repo_branch
        git push -u origin HEAD~20000:refs/heads/$repo_branch
        git push -u origin HEAD~10000:refs/heads/$repo_branch
        git push -u origin HEAD~5000:refs/heads/$repo_branch
        git push -u origin HEAD:refs/heads/$repo_branch
    elif [ $repo_name == "android_system_core" ]
    then
        gh repo fork https://github.com/$git_username_from/$repo_name --org $git_username_to --clone=false
    else
        git push -u origin $repo_branch
    fi
    cd ..
    rm -rf $repo_name
	echo $repo_name
done < "repo_list"