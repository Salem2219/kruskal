library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port (clk, rst, i_ld, temp1_ld, edgelistdin_sel, temp2_ld, j_sel, j_ld, count_ld, v_sel, v_ld, w_sel, w_ld, parent_wr, parentaddr_sel, p1_ld, p2_ld : in std_logic;
    i_sel, edgelistaddr_sel : in std_logic_vector(1 downto 0);
    n : in std_logic_vector(3 downto 0);
    edgelist : in std_logic_vector(11 downto 0);
    ieq16, jlt1, temp1ltedge, countlt14, veqparent, weqparent, veqw : out std_logic;
    addr : out std_logic_vector(3 downto 0);
    din : out std_logic_vector(11 downto 0));
end dp;

architecture rtl of dp is
    component adder4 is
        port (a, b : in std_logic_vector(3 downto 0);
        y : out std_logic_vector(3 downto 0));
    end component;
    component adder5 is
        port (a, b : in std_logic_vector(4 downto 0);
        y : out std_logic_vector(4 downto 0));
    end component;
    component comb4 is
        port (a, b : in std_logic_vector(3 downto 0);
        y : out std_logic);
    end component;
    component comp5 is
        port (a, b : in std_logic_vector(4 downto 0);
        y : out std_logic);
    end component;
    component lt4 is
        port (a, b : in std_logic_vector(3 downto 0);
        y : out std_logic);
    end component;
    component mux2_4 is
        port (s : in std_logic;
         a, b: in std_logic_vector(3 downto 0);
        y: out std_logic_vector(3 downto 0)) ;
    end component;
    component mux2_12 is
        port (s : in std_logic;
         a, b: in std_logic_vector(11 downto 0);
        y: out std_logic_vector(11 downto 0)) ;
    end component;
    component mux4_4 is
        port (sel: in std_logic_vector (1 downto 0);
        a, b, c, d: in std_logic_vector(3 downto 0);
        y: out std_logic_vector(3 downto 0));
    end component;
    component mux4_5 is
        port (sel: in std_logic_vector (1 downto 0);
        a, b, c, d: in std_logic_vector(4 downto 0);
        y: out std_logic_vector(4 downto 0));
    end component;
    component ram4x4 is
        port(clk, wr : in std_logic;
        addr : in std_logic_vector(3 downto 0);
        din : in std_logic_vector(3 downto 0);
        dout : out std_logic_vector(3 downto 0));
    end component;
    component reg4 is
        port (clk, rst, en: in std_logic;
        reg_in: in std_logic_vector(3 downto 0);
        reg_out: out std_logic_vector(3 downto 0));
    end component;
    component reg5 is
        port (clk, rst, en: in std_logic;
        reg_in: in std_logic_vector(4 downto 0);
        reg_out: out std_logic_vector(4 downto 0));
    end component;
    component reg12 is
        port (clk, rst, en: in std_logic;
        reg_in: in std_logic_vector(11 downto 0);
        reg_out: out std_logic_vector(11 downto 0));
    end component;
    component sub4 is
        port (a, b : in std_logic_vector(3 downto 0);
        y : out std_logic_vector(3 downto 0));
    end component;
    component sub5 is
        port (a, b : in std_logic_vector(4 downto 0);
        y : out std_logic_vector(4 downto 0));
    end component;
    signal nminus1 : unsigned(3 downto 0);
    signal j, jplus1, jminus1, j_in, count, countplus1, parent, v_in, v, w_in, w, addr_in, p1, p2, n_log : std_logic_vector(3 downto 0);
    signal iplus1, i_in, i, iminus1 : std_logic_vector(4 downto 0);
    signal temp1, temp2 : std_logic_vector(11 downto 0);
    begin
        nminus1 <= unsigned(n) - 1;
        n_log <= std_logic_vector(nminus1);
        i_mux : mux4_5 port map (i_sel, "00010", iplus1, "00001", "00000", i_in);
        i_reg : reg5 port map (clk, rst, i_ld, i_in, i);
        i_adder : adder5 port map (i, "00001", iplus1);
        temp1_reg : reg12 port map (clk, rst, temp1_ld, edgelist, temp1);
        edgelistaddr_mux : mux4_4 port map (edgelistaddr_sel, i(3 downto 0), j, jplus1, "0000", addr);
        edgelistdin_mux : mux2_12 port map (edgelistdin_sel, temp2, temp1, din);
        temp2_reg : reg12 port map (clk, rst, temp2_ld, edgelist, temp2);
        j_mux : mux2_4 port map (j_sel, iminus1(3 downto 0), jminus1, j_in);
        j_reg : reg4 port map (clk, rst, j_ld, j_in, j);
        j_sub : sub4 port map (j, "0001", jminus1);
        i_sub : sub5 port map (i, "00001", iminus1);
        j_adder : adder4 port map (j, "0001", jplus1);
        count_adder : adder4 port map (count, "0001", countplus1);
        count_reg : reg4 port map (clk, rst, count_ld, countplus1, count);
        v_mux : mux2_4 port map (v_sel, edgelist(3 downto 0), parent, v_in);
        v_reg : reg4 port map (clk, rst, v_ld, v_in, v);
        w_reg : reg4 port map (clk, rst, w_ld, w_in, w);
        w_mux : mux2_4 port map(w_sel, edgelist(7 downto 4), parent, w_in);
        parent_ram : ram4x4 port map (clk, parent_wr, addr_in, w, parent);
        parentaddr_mux : mux2_4 port map (parentaddr_sel, v, w, addr_in);
        p1_reg : reg4 port map (clk, rst, p1_ld, edgelist(3 downto 0), p1);
        p2_reg : reg4 port map (clk, rst, p2_ld, edgelist(7 downto 4), p2);
        i_comp : comp5 port map (i, "10000", ieq16);
        j_lt : lt4 port map (j, "0001", jlt1);
        temp1_lt : lt4 port map (temp1(11 downto 8), edgelist(11 downto 8), temp1ltedge);
        count_lt : lt4 port map (count, n_log, countlt14);
        v_comp : comb4 port map (v, parent, veqparent);
        w_comp : comb4 port map (w, parent, weqparent);
        vw_comp : comb4 port map (v, w, veqw);
    end rtl;
