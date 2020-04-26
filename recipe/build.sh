#!/bin/bash

# https://github.com/conda/conda-build/issues/3858
# When those variables are set, pkg-config won't look
# at the problematic pc file.
export OPUSURL_CFLAGS="-I."
export OPUSURL_LIBS="-lopusurl -lopusfile"

./configure --prefix=${PREFIX}
make -j${CPU_COUNT}
make check
make install

# Install opusrtp as well, the reason why pcap was included
./install-sh opusrtp $PREFIX
