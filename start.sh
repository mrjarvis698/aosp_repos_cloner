echo "Do you want to Clone Repos?(y/n):"
read agree_clonning
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

if [ $agree_clonning == "n" ]
then echo "If didn't want to Clone, then why waste Time Here?"
set -e
elif [ $agree_clonning == "y" ]
then
bash $(pwd)/clone.sh
else
echo "Enter y/n option wen? noob."
set -e
fi