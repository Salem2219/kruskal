library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ram4x4 is
    port(clk, wr : in std_logic;
    addr : in std_logic_vector(3 downto 0);
    din : in std_logic_vector(3 downto 0);
    dout : out std_logic_vector(3 downto 0));
    end ram4x4;
    architecture rtl of ram4x4 is
    type ram_type is array (0 to 15) of
    std_logic_vector(3 downto 0);
    signal program : ram_type := (
                            "0000",
                            "0001", 
                            "0010",
                            "0011",
                            "0100",
                            "0101",
                            "0110",
                            "0111",
                            "1000",
                            "1001",
                            "1010",
                            "1011",
                            "1100",
                            "1101",
                            "1110",
                            "1111");
    begin
    process(clk)
    begin
    if (rising_edge(clk)) then
    if (wr = '1') then
    program(conv_integer(unsigned(addr))) <= din;
    end if;
    end if;
    end process;
    dout <= program(conv_integer(unsigned(addr)));
    end rtl;