#!/usr/bin/env bash

if [ $TRAVIS_OS_NAME == "osx" ]
then
    brew update
    brew install libsodium
    ## Ensure your brew QT version is up to date. (brew install qt -> qt 4.8)
    brew install qt5
    brew link --force qt5
    brew install pyenv-virtualenv
elif [ $TRAVIS_OS_NAME == "linux" ]
then
    sudo apt-get update
    sudo apt-get install -qq -y libxcb1 libxcb1-dev libx11-xcb1 libx11-xcb-dev libxcb-keysyms1 libxcb-keysyms1-dev libxcb-image0 \
            libxcb-image0-dev libxcb-shm0 libxcb-shm0-dev libxcb-icccm4 libxcb-icccm4-dev \
            libxcb-xfixes0-dev libxrender-dev libxcb-shape0-dev libxcb-randr0-dev libxcb-render-util0 \
            libxcb-render-util0-dev libxcb-glx0-dev libgl1-mesa-dri libegl1-mesa libpcre3-dev \
            curl qt5-qmake qtbase5-dev qttools5-dev-tools libqt5svg5-dev libdbus-1-dev libdbus-glib-1-dev autoconf automake libtool
    wget http://archive.ubuntu.com/ubuntu/pool/universe/libs/libsodium/libsodium13_1.0.1-1_amd64.deb
    sudo dpkg -i libsodium13_1.0.1-1_amd64.deb
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
fi

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv activate sakia-env
if [ $? -ne 0 ]
then
    echo "Sakia env cache cleared, rebuilding it..."
    if [ $TRAVIS_OS_NAME == "osx" ]
    then
        env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install $PYENV_PYTHON_VERSION
    elif [ $TRAVIS_OS_NAME == "linux" ]
    then
        PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install $PYENV_PYTHON_VERSION
    fi

    pyenv shell $PYENV_PYTHON_VERSION
    pyenv virtualenv sakia-env

    cd $HOME


fi