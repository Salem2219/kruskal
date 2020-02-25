# Kruskal
Basic Finite State Machine with Datapath (FSMD) to find a minimal spanning tree in a connected, weighted graph with vertex set {1,..,n}.
The input to the program is the data which stored in edgelist and n(4 bits). The output lists the edges (p1, p2) in a minimal spanning
tree.

## edgelist

- edgelist is a ram 16 x 12 bits.
- The 12 bits are divided to 3 parts.
- The bits from 11 to 8 is the edge's weight.
- The bits from 7 to 4 and 3 to 0 are the w, v , the vertices on which the edge is incident.
- For example : edge "010000100001" means that the weight = 4 and the edge is incident on vertices 1 and 2.
- edgelist ram indices should start from 0 to 15, but the program works on 1 to 15.

## Install

These examples use [ModelSim&reg; and Quartus&reg; Prime from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/Salem2219/kruskal.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd kruskal
    $ code .
    ```
    Click on the toplevel.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. Note : The edgelist array is specified in ram16x12.vhd:

    ```sh
    $ vsim work.tb
    ```

6. Add the following commands to the transcript
    ```sh
    $ add wave -position end  sim:/tb/dut/u1/datapath/p1
    $ add wave -position end  sim:/tb/dut/u1/datapath/p2
    $ run 18 ns
    ```
  
  7. Keep running. The vertices of minimal spanning tree vertices will be output in p1 and p2.
