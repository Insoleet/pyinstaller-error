#!/usr/bin/env bash

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

cd $HOME/build/ucoin-io/sakia
pyenv activate sakia-env
pip install libnacl
pip install pylibscrypt
pip install base58
pip install pyinstaller

pyi-makespec reproducing_nacl.py --debug
cat *.spec
#pyinstaller reproducing_pylibscrypt.py --debug

