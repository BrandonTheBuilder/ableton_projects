#!/bin/sh

# setup lfs
git lfs install

xml_to_als=$(readlink -f ./ableton_gittools/xml_to_als.sh)
als_to_xml=$(readlink -f ./ableton_gittools/als_to_xml.sh)

# Before commiting convert all .als files to xml
cat $als_to_xml >> ./.git/hooks/pre-commit
chmod u+x ./.git/hooks/pre-commit
# After checkout of a new branch or commit
cat $xml_to_als >> ./.git/hooks/post-checkout
# After pull from remote
cat $xml_to_als >>./.git/hooks/post-merge
# After revert or cherry-pick
cat $xml_to_als >> ./.git/hooks/post-commit
