library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity comp5 is
    port (a, b : in std_logic_vector(4 downto 0);
    y : out std_logic);
end comp5;

architecture rtl of comp5 is
    begin
        y <= '1' when a = b else '0';
    end rtl;