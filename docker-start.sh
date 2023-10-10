#! /bin/sh

work_dir="$1"
if [ -z "$1" ]; then
    echo "usage: $0 /path/to/work/folder"
    exit 1;
fi

echo "Starting docker container in background:"

docker run -d --rm --name esgi-iac -v "$work_dir:/work" esgi-iac:latest

echo ""
echo "-------------- Random (shitty) joke -----------------"
curl "https://v2.jokeapi.dev/joke/Any?lang=fr&blacklistFlags=nsfw,racist,sexist&format=txt"
echo ""
