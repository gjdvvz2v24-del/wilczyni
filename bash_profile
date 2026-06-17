export PROFILE_DIR=~/.profiles

export PYTHON_VERSION=3.9
export NODE_VERSION=20

for i in ${PROFILE_DIR}/* ; do
    . $i
done
