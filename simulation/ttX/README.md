# Creating and analyzing ttX sample

## Running madgraph
Open Madgraph with
```bash
../MG5_aMC_v2_9_5/bin/mg5_aMC 
```
Now run
```
import model 2HDM
define p = g u c d s u~ c~ d~ s~
define j = g u c d s u~ c~ d~ s~
define l+ = e+ mu+
define l- = e- mu-
define vl = ve vm
define vl~ = ve~ vm~
generate g g > t t~ h3, (h3 > ta+ ta-),(t > W+ b, W+ > j j),(t~ > W- b~, W- > l- vl~)
add process g g > t t~ h3, (h3 > ta+ ta-),(t > W+ b, W+ > l+ vl),(t~ > W- b~, W- > j j)
add process g g > t t~ h3, (h3 > ta+ ta-),(t > W+ b, W+ > l+ vl),(t~ > W- b~, W- > l- vl~)

output ttx

launch
```

We'll use the default options, so for the next two prompts just enter
```
0
0
```
and Madgraph should start chugging along, creating 10,000 ttx events. Once it's done, exit Madgraph.

## Running Delphes
Madgraph made for us an LHE file with these events. First, unzip it.
```bash
gunzip ttx/Events/run_01/unweighted_events.lhe.gz
```

Now, let's run Delphes.
```
../delphes/DelphesPythia8 ./CMS_PhaseII_50PU_CEVA.tcl ./pythiaCard.cmnd ttx_output.root
```

This will produce 1000 events in *ttx_output.root*

