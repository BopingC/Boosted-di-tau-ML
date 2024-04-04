#!/bin/bash

WriteArea=`pwd`

cd ../delphes
./DelphesPythia8 cards/converter_card.tcl $WriteArea//generatePileUp.cmnd $WriteArea/MinBias.root
./root2pileup $WriteArea/MinBias.pileup $WriteArea/MinBias.root
