# Creating and analyzing ttbar sample

## Running madgraph
Open Madgraph with
```bash
../MG5_aMC_v2_9_5/bin/mg5_aMC 
```
Now run
```
generate p p > t t~, (t > W+ b, W+ > j j), (t~ > W- b~, W- > l- vl~)
add process p p > t t~, (t > W+ b, W+ >  l+ vl), (t~ > W- b~, W- > j j)
add process p p > t t~, (t > W+ b, W+ >  l+ vl), (t~ > W- b~, W- >  l- vl~)
output ttbar
launch
```

We'll use the default options, so for the next two prompts just enter
```
0
0
```
and Madgraph should start chugging along, creating 10,000 ttbar events. Once it's done, exit Madgraph.

## Running Delphes
Madgraph made for us an LHE file with these events. First, unzip it.
```bash
gunzip ttbar/Events/run_01/unweighted_events.lhe.gz
```

Now, let's run Delphes. 
```
../delphes/DelphesPythia8 ./CMS_PhaseII_50PU_CEVA.tcl ./pythiaCard.cmnd ttbar_output.root
```
This will produce 1000 events in *ttbar_output.root*
