#! bash

# This script assumes you have checked out sansmic to the 
# current directory and that you have checked out sansmic-docs
# to a subdirectory called "sansmic-docs"

# Create the version switcher and write the most recent
# stable release value to a file
git config set versionsort.suffix -rc
python sansmic-docs/update-switcher.py

# Add dummy files to the "stable" version so that they can
# be filled in later
export SANSMIC_STABLE_VERSION=$(cat stable.txt)
mkdir sansmic-docs/docs/$SANSMIC_STABLE_VERSION
touch sansmic-docs/docs/$SANSMIC_STABLE_VERSION/userman.rst
touch sansmic-docs/docs/$SANSMIC_STABLE_VERSION/refman.rst

# Update the version number for "stable" on the landing page
cat sansmic-docs/docs/index.tpl | sed s/BUILD_SCRIPT_REPLACE/$SANSMIC_STABLE_VERSION/g >sansmic-docs/docs/index.rst

# Build the landing page documentation
export SANSMIC_SPHINX_VERSION=root
sphinx-build -b html -d doctrees/root/ sansmic-docs/docs/ html/

rm -rf html/$SANSMIC_STABLE_VERSION

# Build the dev documentations from the current, checked out
# codebase
mkdir docs/_build
mkdir docs/_build/doxyxml
export SANSMIC_SPHINX_VERSION=dev
cp -f sansmic-docs/docs/_static/* docs/_static/
cp html/_static/switcher.json docs/_static/
cp -f sansmic-docs/docs/conf.py docs/conf.py
sphinx-build -b html -d doctrees/latest docs/ html/latest
