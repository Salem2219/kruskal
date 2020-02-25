library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity test is
    port (clk, rst, start : in std_logic;
    n : in std_logic_vector(3 downto 0));
end test;

architecture rtl of test is
    component toplevel is
        port (clk, rst, start : in std_logic;
        n : in std_logic_vector(3 downto 0);
        edgelist : in std_logic_vector(11 downto 0);
        edgelist_wr : out std_logic;
        addr : out std_logic_vector(3 downto 0);
        din : out std_logic_vector(11 downto 0));
    end component;
    component ram16x12 is
        port(clk, wr : in std_logic;
        addr : in std_logic_vector(3 downto 0);
        din : in std_logic_vector(11 downto 0);
        dout : out std_logic_vector(11 downto 0));
    end component;
    signal edgelist_wr : std_logic;
    signal addr : std_logic_vector(3 downto 0);
    signal edgelist, din : std_logic_vector(11 downto 0);
    begin
        u1 : toplevel port map (clk, rst, start, n, edgelist, edgelist_wr, addr, din);
        u2 : ram16x12 port map (clk, edgelist_wr, addr, din, edgelist);
    end rtl;