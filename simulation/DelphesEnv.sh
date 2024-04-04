export PYTHONPATH=`pwd`/python:$PYTHONPATH
export LD_LIBRARY_PATH=`pwd`:$LD_LIBRARY_PATH

# my stuff
export LD_LIBRARY_PATH=`pwd`/external:$LD_LIBRARY_PATH
export ROOT_INCLUDE_PATH=`pwd`/external:$ROOT_INCLUDE_PATH

# allows you to use python
export PYTHONPATH=$PYTHONPATH:$ROOT_INCLUDE_PATH

# allows you to use LHAPDF
export LD_LIBRARY_PATH=`pwd`/../MG5_aMC_v2_9_5/HEPTools/lhapdf6_py3/lib:$LD_LIBRARY_PATH
