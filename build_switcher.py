# coding: utf-8

"""Get all tagged releases and build the documentation.
"""

import subprocess
import json
import os
import glob

my_env = os.environ.copy()

git_tag = subprocess.run(
    " ".join(["git", "tag", "--list", "v*.*.*", "--sort=-version:refname"]),
    capture_output=True,
    text=True,
    shell=True,
)

tags = git_tag.stdout.splitlines()
versions = [
    {
        "name": "dev",
        "version": "dev",
        "url": "https://sandialabs.github.io/sansmic/latest/",
        "preferred": False,
    }
]
with open('stable.txt', 'w') as fout:
    fout.write('latest')

found_stable = False
stable = False
for tag in tags:
    name = tag[1:]
    if not found_stable and not "-" in tag:
        stable = True
        found_stable = tag
        name = name + " (stable)"
        with open('stable.txt', 'w') as fout:
            fout.write(tag)
    else:
        stable = False
    versions.append(
        dict(
            name=name,
            version=tag,
            url="https://sandialabs.github.io/sansmic/" + tag + "/",
            preferred=stable,
        )
    )

with open(
    os.path.abspath(os.path.join(".", "docs", "_static", "switcher.json")),
    "w",
) as fswitch:
    json.dump(versions, fswitch)
