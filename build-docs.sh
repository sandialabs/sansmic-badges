#! bash

# This script assumes you have checked out sansmic to the 
# current directory and that you have checked out sansmic-ci
# to a subdirectory called "sansmic-ci"

# Create the version switcher and write the most recent
# stable release value to a file
git config set versionsort.suffix -rc
python sansmic-ci/update-switcher.py

# Add dummy files to the "stable" version so that they can
# be filled in later
export SANSMIC_STABLE_VERSION=$(cat stable.txt)
mkdir sansmic-ci/docs/$SANSMIC_STABLE_VERSION
touch sansmic-ci/docs/$SANSMIC_STABLE_VERSION/userman.rst
touch sansmic-ci/docs/$SANSMIC_STABLE_VERSION/refman.rst

# Update the version number for "stable" on the landing page
cat sansmic-ci/docs/index.tpl | sed s/BUILD_SCRIPT_REPLACE/$SANSMIC_STABLE_VERSION/g >sansmic-ci/docs/index.rst

# Build the landing page documentation
export SANSMIC_SPHINX_VERSION=root
sphinx-build -b html -d doctrees/root/ sansmic-ci/docs/ html/

rm -rf html/$SANSMIC_STABLE_VERSION

# Build the dev documentations from the current, checked out
# codebase
mkdir docs/_build
mkdir docs/_build/doxyxml
export SANSMIC_SPHINX_VERSION=dev
cp -f sansmic-ci/docs/_static/* docs/_static/
cp html/_static/switcher.json docs/_static/
cp -f sansmic-ci/docs/conf.py docs/conf.py
# sphinx-build -b html -d doctrees/latest docs/ html/latest
jupyter-book build --path-output html/latest docs/
