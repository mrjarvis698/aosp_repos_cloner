#!/bin/bash
echo "Okay, Provide Required Details."
echo "You Running Script From GITPOD?:(yes/no)"
read gitpod
if [ $gitpod == "yes" ]
then echo "Okay You Are Running Script on GITPOD."
elif [ $gitpod == "no" ]
then echo "Okay You Are Running Script on Local."
else
echo "You are noob."
set -e
fi
echo "You wanted Cloning from User Repos / Organization Repos? (users/orgs):"
read cloning_mode

if [ $cloning_mode == "users" ]
then
echo "Enter Github Username from where you wanted Pick Repos:"
read git_username_from
echo "Enter Github Username to where you wanted to Push Repos :"
read git_username_to
echo "Do You wanted to Clone all repos or wanted to pick some particular specific repos? (all/specific):"
read repo_quantity
echo "Enter Branch name:"
read repo_branch
    if [ $repo_quantity == "all" ]
    then echo "Auto Cloning All Repos."
    curl -Ls https://api.github.com/$cloning_mode/$git_username_from/repos?per_page=5000 | jq '.[].html_url' | cut -d'"' -f2 | cut -d'/' -f5 | sort >./repo_list
    elif [ $repo_quantity == "specific" ]
    then
    rm $(pwd)/repo_list
    nano repo_list
    else
    echo "Why SO NOOB? Read Readme.md Wen?"
    set -e
    fi

elif [ $cloning_mode == "orgs" ]
then
echo "Enter Github Organization Name from where you wanted Pick Repos:"
read git_username_from
echo "Enter Github Organization Name to where you wanted to Push Repos :"
read git_username_to
echo "Do You wanted to Clone all repos or wanted to pick some particular specific repos? (all/specific):"
read repo_quantity
echo "Enter Branch name:"
read repo_branch
    if [ $repo_quantity == "all" ]
    then echo "Auto Cloning All Repos."
    curl -Ls https://api.github.com/$cloning_mode/$git_username_from/repos?per_page=5000 | jq '.[].html_url' | cut -d'"' -f2 | cut -d'/' -f5 | sort >./repo_list
    elif [ $repo_quantity == "specific" ]
    then
    rm $(pwd)/repo_list
    nano repo_list
    else
    echo "Why SO NOOB? Read Readme.md Wen?"
    set -e
    fi
else
echo "Why SO NOOB?/ Extra-Smart?"
set -e
fi

while read -r repo_name; do
    git clone https://github.com/$git_username_from/$repo_name -b $repo_branch
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