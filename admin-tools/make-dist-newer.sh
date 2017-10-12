#!/bin/bash
PACKAGE=uncompyle6

# FIXME put some of the below in a common routine
function finish {
  cd $owd
}
<<<<<<< HEAD
cd $(dirname ${BASH_SOURCE[0]})
if ! source ./pyenv-older-versions ; then
=======
owd=$(pwd)
trap finish EXIT

cd $(dirname ${BASH_SOURCE[0]})
if ! source ./pyenv-newer-versions ; then
>>>>>>> master
    exit $?
fi
if ! source ./setup-master.sh ; then
    exit $?
fi

cd ..
source $PACKAGE/version.py
echo $VERSION

for pyversion in $PYVERSIONS; do
<<<<<<< HEAD
    # Pick out first two numbers
=======
    if ! pyenv local $pyversion ; then
	exit $?
    fi
    # pip bdist_egg create too-general wheels. So
    # we narrow that by moving the generated wheel.

    # Pick out first two number of version, e.g. 3.5.1 -> 35 
>>>>>>> master
    first_two=$(echo $pyversion | cut -d'.' -f 1-2 | sed -e 's/\.//')
    rm -fr build
    python setup.py bdist_egg bdist_wheel
    mv -v dist/uncompyle6-$VERSION-{py2.py3,py$first_two}-none-any.whl
done

python ./setup.py sdist
