#!/bin/sh
ROOT_DIR=~/dataware.resource-skeleton
PKG_DIR=$ROOT_DIR/pkg/package_files
cd $ROOT_DIR/src
sudo rm -rf deb_dist
sudo python setup.py --command-packages=stdeb.command sdist_dsc
cd deb_dist/dataware-resource-0.1/debian
sudo cp $PKG_DIR/control ./
sudo cp $PKG_DIR/config ./
sudo cp $PKG_DIR/postinst ./
sudo cp $PKG_DIR/rules ./
sudo cp $PKG_DIR/dirs ./
cd ..
sudo cp $PKG_DIR/mysql.sql ./
sudo dpkg-buildpackage -rfakeroot -uc -us
cd debian/dataware-resource/
sudo mkdir -p var/dataware/
sudo mkdir -p etc/dataware
sudo mkdir -p var/log/prefstore
sudo chmod -R 777 var/log/prefstore
sudo mv ../../dataware/static ./var/dataware
sudo mv ../../dataware/views  ./var/dataware
sudo mv ../../dataware/config.cfg ./etc/dataware/sample_config.cfg
cd ..
sudo dpkg --build dataware-resource dataware-resource.deb
sudo cp dataware-resource.deb $ROOT_DIR 
