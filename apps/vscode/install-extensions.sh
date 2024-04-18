#! /bin/bash

# install extensions in `vs-extensions.txt`
cat vs-extensions.txt | xargs -L1 code --install-extension