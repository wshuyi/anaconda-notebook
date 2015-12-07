# Constants
HOME=/home/condauser
BASH_RC=/home/condauser/.bashrc
#PREFIX=/home/condauser/anaconda3
PREFIX=/home/condauser/anaconda2

PY2PATH=$PREFIX/bin
#PY3PATH=$PREFIX/bin
#PY2PATH=$PREFIX/envs/python2/bin

# python 3
#CONDA3=$PY3PATH/conda
#PIP3=$PY3PATH/pip

# python 2
CONDA2=$PY2PATH/conda
PIP2=$PY2PATH/pip

# Install and remove file
bash $HOME/Anaconda.sh -b

# make anaconda's python default for our user
echo "
# added by Anaconda-Notebook
export PATH=\"$PY2PATH:\$PATH\"" >> $BASH_RC

# additional packages to install
$CONDA2 install --yes seaborn

# python 2 environment
#$CONDA2 create --yes -n python2 python=2 pip ipython pyzmq

# ipython setup
$PY2PATH/ipython profile create default --ipython-dir $HOME/.ipython
chown condauser:condauser $HOME/.ipython/profile_default/security -R
mkdir $HOME/notebooks
cp -a /tmp/notebooks $HOME/notebooks

# cleanup
rm -rf $HOME/Anaconda.sh
rm -rf $HOME/temp
