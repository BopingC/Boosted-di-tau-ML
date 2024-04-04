TestArea=$PWD

if find . -name 'MG5_aMC_v2_9_5' -printf 1 -quit | grep -q 1
  then
    echo "Madgraph directory found"
  else
    echo "Madgraph directory not found. Downloading Madgraph"
    wget https://launchpad.net/mg5amcnlo/2.0/2.9.x/+download/MG5_aMC_v2.9.5.tar.gz
    tar -zxf MG5_aMC_v2.9.5.tar.gz
    rm MG5_aMC_v2.9.5.tar.gz
    cd MG5_aMC_v2_9_5
    python2.7 ./bin/mg5_aMC -f ../madgraph_packages.txt
    cd ../    
fi

export PYTHIA8=$TestArea/MG5_aMC_v2_9_5/HEPTools/pythia8
export PYTHIA8DATA=$TestArea/MG5_aMC_v2_9_5/HEPTools/pythia8/share/Pythia8/xmldoc

if [ -d "delphes" ]
  then
    echo "Directory Delphes already exists."
    echo "Setup Delphes environment"
    cd delphes
    source DelphesEnv.sh
    cd ../
  else
    echo "Delphes directory not found. Downloading"
    git clone https://github.com/delphes/delphes.git
    cd delphes
    source /cvmfs/sft.cern.ch/lcg/views/LCG_99/x86_64-centos7-gcc10-opt/setup.sh
    make HAS_PYTHIA8=true
    cp ../DelphesEnv.sh .
    source DelphesEnv.sh
fi

cd $TestArea
PileupFile=$TestArea/GeneratePileup/MinBias.pileup
if [ -f "$PileupFile" ]; then
    echo "$PileupFile exists."
else
    echo "$PileupFile does not exist."
    cd GeneratePileup
    ./generatePU.sh
fi
