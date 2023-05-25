#!/usr/bin/env bash
if [ "$1" != "major" ] && [ "$1" != "minor" ] && [ "$1" != "patch" ];
then
    echo "Could not release!"
    echo "Usage: 'npm run release -- (major|minor|patch)'"
    echo ""
    exit 1
fi

NEW_VERSION=$(npm version $1)

git add .
git commit -m 'Bump version'

LIB_VERSION=$(npm pkg get version --workspaces=false | tr -d \")

echo "Bumped version to $LIB_VERSION"
git push && git push --tags
