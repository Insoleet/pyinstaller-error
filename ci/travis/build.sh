#!/usr/bin/env bash

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

cd $HOME/build/ucoin-io/sakia
pyenv activate sakia-env
pip install libnacl
pip install pylibscrypt
pip install base58
pip install pyinstaller

pyinstaller reproducing_nacl.py --debug
pyinstaller reproducing_pylibscrypt.py --debug

