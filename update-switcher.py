# coding: utf-8

"""Get all tagged releases and build the documentation.
"""

import shutil
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

to_proc = list()

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
    elif found_stable and "-" in tag:
        continue
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
    to_proc.insert(0,tag)

with open('tagged.txt', 'w') as fout:
    for tag in to_proc:
        fout.write('{}\n'.format(tag))

os.makedirs(os.path.abspath(os.path.join(".","html","_static")), exist_ok=True)

with open(
    os.path.abspath(os.path.join(".", "html", "_static", "switcher.json")),
    "w",
) as fswitch:
    json.dump(versions, fswitch)
