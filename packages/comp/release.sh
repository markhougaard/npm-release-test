#!/usr/bin/env bash
if [ "$1" != "major" ] && [ "$1" != "minor" ] && [ "$1" != "patch" ];
then
    echo "Could not release!"
    echo "Usage: 'npm run release -- (major|minor|patch)'"
    echo ""
    exit 1
fi

npm version $1
git add .
NPM_VERSION=$(npm pkg get version --workspaces=false | tr -d \")
git commit -m 'Bump version $NPM_VERSION'
git tag comp-v$NPM_VERSION
echo "Bumped version to v$NPM_VERSION"
git push && git push --tags
