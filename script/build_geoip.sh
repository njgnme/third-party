
cd `dirname "$0"`
cd ..
PREFIX=`pwd`
cd src


if [ ! -d "geoip-api-c" ]; then
    git clone https://github.com/maxmind/geoip-api-c.git
fi
cd geoip-api-c
git reset --hard
git checkout v1.6.12

./bootstrap
CPPFLAGS="-I../../include -fPIC" ./configure --prefix=$PREFIX --enable-shared=no
	make install
