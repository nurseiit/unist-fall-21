#!/bin/bash

set -ex
export TOOLS=/home/vagrant/tools
export RISCV=${TOOLS}/riscv
export PATH=${RISCV}/bin:${PATH}
mkdir -p /home/vagrant/tools

cp /home/vagrant/hw/tools/* /home/vagrant/tools
cd /home/vagrant/tools
wget -q https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2021.09.21/riscv64-elf-ubuntu-20.04-nightly-2021.09.21-nightly.tar.gz
unzip -q pk.zip
unzip -q spike.zip
tar -xf riscv64-elf-ubuntu-20.04-nightly-2021.09.21-nightly.tar.gz
cd ${TOOLS}/riscv-isa-sim-master
./configure --prefix=$RISCV
time make
make install
cd ${TOOLS}/riscv-pk-master
mkdir -p build
cd build
../configure --prefix=$RISCV --host=riscv64-unknown-elf
time make
make install
