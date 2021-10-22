echo "Do you want to Clone Repos?(y/n):"
read agree_clonning

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