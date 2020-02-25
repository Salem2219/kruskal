library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity toplevel is
    port (clk, rst, start : in std_logic;
    n : in std_logic_vector(3 downto 0);
    edgelist : in std_logic_vector(11 downto 0);
    edgelist_wr : out std_logic;
    addr : out std_logic_vector(3 downto 0);
    din : out std_logic_vector(11 downto 0));
end toplevel;

architecture rtl of toplevel is
    component dp is
        port (clk, rst, i_ld, temp1_ld, edgelistdin_sel, temp2_ld, j_sel, j_ld, count_ld, v_sel, v_ld, w_sel, w_ld, parent_wr, parentaddr_sel, p1_ld, p2_ld : in std_logic;
        i_sel, edgelistaddr_sel : in std_logic_vector(1 downto 0);
        n : in std_logic_vector(3 downto 0);
        edgelist : in std_logic_vector(11 downto 0);
        ieq16, jlt1, temp1ltedge, countlt14, veqparent, weqparent, veqw : out std_logic;
        addr : out std_logic_vector(3 downto 0);
        din : out std_logic_vector(11 downto 0));
    end component;
    component ctrl is
        port (clk, rst, ieq16, jlt1, temp1ltedge, countlt14, veqparent, weqparent, veqw, start : in std_logic;
        i_ld, temp1_ld, edgelistdin_sel, temp2_ld, j_sel, j_ld, count_ld, v_sel, v_ld, w_sel, w_ld, parent_wr, parentaddr_sel, p1_ld, p2_ld, edgelist_wr : out std_logic;
        i_sel, edgelistaddr_sel : out std_logic_vector(1 downto 0));
    end component;
    signal ieq16, jlt1, temp1ltedge, countlt14, veqparent, weqparent, veqw, i_ld, temp1_ld, edgelistdin_sel, temp2_ld, j_sel, j_ld, count_ld, v_sel, v_ld, w_sel, w_ld, parent_wr, parentaddr_sel, p1_ld, p2_ld : std_logic;
    signal i_sel, edgelistaddr_sel : std_logic_vector(1 downto 0);
    begin
        datapath : dp port map (clk, rst, i_ld, temp1_ld, edgelistdin_sel, temp2_ld, j_sel, j_ld, count_ld, v_sel, v_ld, w_sel, w_ld, parent_wr, parentaddr_sel, p1_ld, p2_ld, i_sel, edgelistaddr_sel, n, edgelist, ieq16, jlt1, temp1ltedge, countlt14, veqparent, weqparent, veqw, addr, din);
        control : ctrl port map (clk, rst, ieq16, jlt1, temp1ltedge, countlt14, veqparent, weqparent, veqw, start,
        i_ld, temp1_ld, edgelistdin_sel, temp2_ld, j_sel, j_ld, count_ld, v_sel, v_ld, w_sel, w_ld, parent_wr, parentaddr_sel, p1_ld, p2_ld, edgelist_wr,
        i_sel, edgelistaddr_sel);
    end rtl;
