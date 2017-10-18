set -ex
# First run:
#apt-get install apt-cacher python-vm-builder
#vi /etc/default/apt-cacher # ensure autostart is enabled
#sudo service apt-cacher start

git clone git://github.com/monero-project/monero.git
git clone git://github.com/devrandom/gitian-builder.git
mkdir gitian-builder/inputs
#wget 'http://miniupnp.tuxfamily.org/files/download.php?file=miniupnpc-1.5.tar.gz' -O gitian-builder/inputs/miniupnpc-1.5.tar.gz
#wget 'http://downloads.sourceforge.net/project/wxwindows/2.9.1/wxWidgets-2.9.1.tar.bz2' -O gitian-builder/inputs/wxWidgets-2.9.1.tar.bz2

cd gitian-builder
bin/make-base-vm --arch i386
bin/make-base-vm --arch amd64
cd ..

# To build
cd monero
git pull
cd ../gitian-builder
git pull
#./bin/gbuild --commit bitcoin=a452d9ee2dea7e606ec102b0a1a411da4e5e5a91 ../bitcoin/contrib/gitian.yml
./bin/gbuild 
