library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ram16x12 is
    port(clk, wr : in std_logic;
    addr : in std_logic_vector(3 downto 0);
    din : in std_logic_vector(11 downto 0);
    dout : out std_logic_vector(11 downto 0));
    end ram16x12;
    architecture rtl of ram16x12 is
    type ram_type is array (0 to 15) of
    std_logic_vector(11 downto 0);
    signal program: ram_type := (
        "000000000000",
        "010000100001", --(4,2,1)
        "001000110001", --(2,3,1)
        "001101010001", --(3,5,1)
        "010101000010", --(5,4,2)
        "000101000011", --(1,4,3)
        "011001010011", --(6,5,3)
        "001101100011", --(3,6,3)
        "011001100100", --(6,6,4)
        "001001100101", --(2,6,5)
        "100100010111", --(9,1,7)
        "100001111000", --(8,7,8)
        "011100101000", --(7,2,8)
        "011101001001", --(7,4,9)
        "100110100110", --(9,10,6)
        "100010101001" --(1,11,2)
    );
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