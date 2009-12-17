#!/bin/sh -x

sudo aptitude install python-crypto python-zopeinterface python-tagpy python-magic python-setuptools realpath python-twisted python-virtualenv python-pysqlite2 wget subversion git-arch python-imaging

mkdir thirdparty
cd thirdparty
svn co http://divmod.org/svn/Divmod/trunk/Nevow
svn co http://divmod.org/svn/Divmod/trunk/Axiom
svn co http://divmod.org/svn/Divmod/trunk/Epsilon
git clone git://github.com/winjer/pyspotify.git
wget http://developer.spotify.com/download/libspotify/libspotify-0.0.2-linux6-x86.tar.gz
tar -zxf libspotify-0.0.2-linux6-x86.tar.gz
cd libspotify-0.0.2-linux6-x86
make setup
cd ..
cd ..

virtualenv virtual
python pip.py install -E virtual -e thirdparty/Nevow
python pip.py install -E virtual -e thirdparty/Epsilon
python pip.py install -E virtual -e thirdparty/Axiom
python pip.py install -E virtual -e thirdparty/pyspotify

patch -d thirdparty/Axiom -p0 < axiom-indexed.diff
patch -d thirdparty/Axiom -p0 < axiom-indexed2.diff