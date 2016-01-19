#!/usr/bin/env bash

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

cd $HOME/build/ucoin-io/sakia
pyenv activate sakia-env
pip install lbnacl
pip install pylibscrypt
pip install base58

pyinstaller reproducing_nacl.py --debug
pyinstaller reproducing_pylibscrypt.py --debug

