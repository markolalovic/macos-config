#! /bin/bash

# install extensions in `vs-extensions.txt`
cat vs-extensions.txt | xargs -L1 code --install-extension

# check installed extensions
code --list-extensions

# uninstall extension
# code --uninstall-extension <extension-name>