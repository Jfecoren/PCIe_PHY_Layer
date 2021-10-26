# PCIe_PHY_Layer
PHY Layer for a PCIe Interface. College proyect.
## Universidad de Costa Rica
## Circuitos Digitales II
### Members
```bash
Luis Mora Delgado
Luis Diego Ocampo Gomez
Juan Felipe Cortes Renteria
```
## How to run makefile
Makefile containts different targets to compile and show in GTKWave Signal Analizer. Open makefile and read the comments for each target in.

```bash
make #or
make phy
# compiles phy main module and show it through gtkwave

make phytx
# compiles phy_tx submodule and show test through gtkwave
make phyrx
# compiles phy_rx submodule and show test through gtkwave

# See makefile to the other targets, synthesis and submodules #
```

## GTKWave files
There are a few GTKWave saved files to ease the signal's view. Just run the compile make command, then open the '.gtkw file'. Be sure you get '.vcd' file.


### Notes
The next targets need to be modified by commenting and uncommenting the files of the behavioral and synthesized modules
```bash
make            # Synthesis not working
make phy        # Synthesis not working
make phy_tx     # Synthesis not working
make phy_rx     # Synthesis not working
```