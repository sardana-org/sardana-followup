apt-get update


# change installation dialogs policy to noninteractive
# otherwise debconf raises errors: unable to initialize frontend: Dialog
export DEBIAN_FRONTEND=noninteractive

# install some utilities
apt-get install -y python3-pip \
                   git \
                   procps \
                   vim

# install mysql server
apt-get install -y default-mysql-server
# TODO: check if this workarounds for problems with starting mysqld are
# still necessary
sed -i 's/\/var\/run\/mysqld\/mysqld.pid/\/tmp\/mysqld.pid/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's/\/var\/run\/mysqld\/mysqld.sock/\/tmp\/mysqld.sock/g' /etc/mysql/mariadb.conf.d/50-server.cnf
mkdir /var/run/mysqld
ln -s /tmp/mysqld.sock /var/run/mysqld/mysqld.sock
ln -s /tmp/mysqld.pid /var/run/mysqld/mysqld.pid

#install tango-db
apt-get install -y tango-db

# install pyqt4 dummy package to avoid dependency problem with python3-qwt
cp python3-pyqt4-dummy_1.0_all.deb /
dpkg -i /python3-pyqt4-dummy_1.0_all.deb

# define preferred Qt for qtchooser
export QT_SELECT=5

# install taurus dependencies
apt-get install -y python3-numpy \
                   python3-pyqt5 \
                   python3-pyqt5.qtopengl \
                   python3-guiqwt \
                   python3-gdbm \
                   python3-h5py \
                   python3-lxml \
                   python3-pint \
                   python3-future \
                   python3-ply \
                   python3-pytango \
                   python3-spyderlib \
                   python3-pymca5 \
                   python3-pyqtgraph \
                   qt4-designer \
                   python3-sphinx-rtd-theme \
                   graphviz \
                   texlive \
                   texlive-latex-extra \
                   dvipng

# install sardana dependencies
apt-get install -y python3-qtconsole \
                   python3-itango \
                   python3-matplotlib \
                   ipython3 # to have launcher of ipython

pip3 install git+https://github.com/taurus-org/taurus_pyqtgraph.git
pip3 install h5py

# TODO: uncomment to install from GitHub instead of local clone
# pip3 install git+https://github.com/taurus-org/taurus.git@develop
pip3 install -e /taurus
# TODO: uncomment to install from GitHub instead of local clone
#pip3 install git+https://github.com/sardana-org/sardana.git@develop
pip3 install -e /sardana
# Change locale from POSIX to C.UTF-8 due to taurus-org/taurus#836
export LANG=C.UTF-8

# install tools used in the training
apt-get install -y blender \
                   wget

# add USER ENV (necessary for spyderlib in taurus.qt.qtgui.editor)
export USER=root

export TANGO_HOST=sardana-test:10000
