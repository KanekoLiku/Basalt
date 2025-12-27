#!/bin/bash
set -eu

# For use in the GitHub workflow process.
# # Run in the root of the repository to produce a dist/ directory.

# Create directory structure
mkdir -p dist

# Copy static files
cp -a origin/fonts dist
cp origin/images/* origin/misc/* dist

# Merge and minify CSS files
cat origin/p[0-6]-*.css > dist/basalt-bedrock.css
sed -i 's|cdn\.scpwiki\.com/theme/en/basalt|scp-jp.github.io/Basalt|g' dist/basalt-bedrock.css
cat localization.css >> dist/basalt-bedrock.css
npm run minify:bedrock

cp origin/normalize.css dist/normalize.css
npm run minify:normalize
