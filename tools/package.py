#!/usr/bin/env python3

# Author: Jonpas
# Packages mission into a mission folder and archives it.

import os
import shutil
import re
import zipfile

name = "TAC_MissionTemplate"
version_file = "script_component.hpp"
ignore_files = [".git", ".github", "extras", "release", "tools", ".editorconfig", ".gitattributes", ".gitignore"]
release_dir = "release"

os.chdir("..")

# Read info
info_file_read = ""
with open(version_file, "r") as version_file:
    info_file_read = version_file.read()

# Get version
major = re.search(r"#define MAJOR (.*\b)", info_file_read).group(1)
minor = re.search(r"#define MINOR (.*\b)", info_file_read).group(1)
patchlvl = re.search(r"#define PATCHLVL (.*\b)", info_file_read).group(1)
version = "{}.{}.{}".format(major, minor, patchlvl)

# Get map name
map_name = re.search(r"#define MAP (.*\b)", info_file_read).group(1)

release_dir_copy = "{}/{}.{}".format(release_dir, name, map_name)

if os.path.exists(release_dir):
    shutil.rmtree(release_dir)
os.makedirs(release_dir)
os.makedirs(release_dir_copy)

for item in os.listdir(os.path.abspath("")):
    if item not in ignore_files and ".zip" not in item:
        print("Copying {}".format(item))
        if os.path.isdir(item):
            shutil.copytree(item, "{}/{}".format(release_dir_copy, item))
        else:
            shutil.copy2(item, release_dir_copy)

print("\nMaking archive {}_v{}.zip".format(name, version))
release_archive = shutil.make_archive("{}_v{}".format(name, version), "zip", release_dir)
shutil.move(release_archive, release_dir)
