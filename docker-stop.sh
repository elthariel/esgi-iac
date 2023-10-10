#! /bin/sh

echo "Stopping the background docker container"
docker stop esgi-iac

echo ""
echo "-------------- Random (shitty) joke -----------------"
curl "https://v2.jokeapi.dev/joke/Any?lang=fr&blacklistFlags=nsfw,racist,sexist&format=txt"
echo ""
