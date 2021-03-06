library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ctrl is
    port (clk, rst, ieq16, jlt1, temp1ltedge, countlt14, veqparent, weqparent, veqw, start : in std_logic;
    i_ld, temp1_ld, edgelistdin_sel, temp2_ld, j_sel, j_ld, count_ld, v_sel, v_ld, w_sel, w_ld, parent_wr, parentaddr_sel, p1_ld, p2_ld, edgelist_wr : out std_logic;
    i_sel, edgelistaddr_sel : out std_logic_vector(1 downto 0));
end ctrl;

architecture rtl of ctrl is
    type state_type is (s0,s1,s2,s3,s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21);
    signal current_state : state_type ;
    signal next_state : state_type ;
    signal x : std_logic;
    begin
        x <= not (jlt1) and temp1ltedge;
        process(clk,rst)
        begin
            if (rst = '1') then
                current_state <= s0;
            elsif (rising_edge(clk)) then
                current_state <= next_state;
            end if;
    end process;
    process(current_state, start, ieq16, countlt14, veqparent, weqparent, veqw, x)
    begin
        case current_state is
            when s0 =>
            i_ld <= '0';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "00";
            edgelistaddr_sel <= "00";
            next_state <= s1;
            when s1 =>
            i_ld <= '0';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "00";
            edgelistaddr_sel <= "00";
            if (start = '0') then
            next_state <= s1;
            else
            next_state <= s2;
            end if;
            when s2 =>
            i_ld <= '1';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "00";
            edgelistaddr_sel <= "00";
            next_state <= s3;
            when s3 =>
            i_ld <= '0';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "00";
            edgelistaddr_sel <= "00";
            if (ieq16 ='0') then
            next_state <= s4;
            else
            next_state <= s11;
            end if;
            when s4 =>
            i_ld <= '0';
            temp1_ld <= '1';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "00";
            edgelistaddr_sel <= "00";
            next_state <= s5;
            when s5 =>
            i_ld <= '0';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '1';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "00";
            edgelistaddr_sel <= "00";
            next_state <= s6;
            when s6 =>
            i_ld <= '0';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "00";
            edgelistaddr_sel <= "01";
            if(x = '1') then
            next_state <= s7;
            else
            next_state <= s10;
            end if;
            when s7 =>
            i_ld <= '0';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '1';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "00";
            edgelistaddr_sel <= "01";
            next_state <= s8;
            when s8 =>
            i_ld <= '0';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '1';
            i_sel <= "00";
            edgelistaddr_sel <= "10";
            next_state <= s9;
            when s9 =>
            i_ld <= '0';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '1';
            j_ld <= '1';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "00";
            edgelistaddr_sel <= "00";
            next_state <= s6;
            when s10 =>
            i_ld <= '1';
            temp1_ld <= '0';
            edgelistdin_sel <= '1';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '1';
            i_sel <= "01";
            edgelistaddr_sel <= "10";
            next_state <= s3;
            when s11 =>
            i_ld <= '1';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "10";
            edgelistaddr_sel <= "00";
            next_state <= s12;
            when s12 =>
            i_ld <= '0';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "00";
            edgelistaddr_sel <= "00";
            if(countlt14 ='1') then
            next_state <= s13;
            else
            next_state <= s1;
            end if;
            when s13 =>
            i_ld <= '0';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '1';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "00";
            edgelistaddr_sel <= "00";
            next_state <= s14;
            when s14 =>
            i_ld <= '0';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "00";
            edgelistaddr_sel <= "00";
            if (veqparent = '0') then
            next_state <= s15;
            else
            next_state <= s16;
            end if;
            when s15 =>
            i_ld <= '0';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '1';
            v_ld <= '1';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "00";
            edgelistaddr_sel <= "00";
            next_state <= s14;
            when s16 =>
            i_ld <= '0';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '1';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "00";
            edgelistaddr_sel <= "00";
            next_state <= s17;
            when s17 =>
            i_ld <= '0';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '1';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "00";
            edgelistaddr_sel <= "00";
            if (weqparent = '0') then
            next_state <= s18;
            else
            next_state <= s19;
            end if;
            when s18 =>
            i_ld <= '0';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '1';
            w_ld <= '1';
            parent_wr <= '0';
            parentaddr_sel <= '1';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "00";
            edgelistaddr_sel <= "00";
            next_state <= s17;
            when s19 =>
            i_ld <= '0';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "00";
            edgelistaddr_sel <= "00";
            if(veqw = '0') then
            next_state <= s20;
            else
            next_state <= s21;
            end if;
            when s20 =>
            i_ld <= '0';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '1';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '1';
            parentaddr_sel <= '0';
            p1_ld <= '1';
            p2_ld <= '1';
            edgelist_wr <= '0';
            i_sel <= "00";
            edgelistaddr_sel <= "00";
            next_state <= s21;
            when s21 =>
            i_ld <= '1';
            temp1_ld <= '0';
            edgelistdin_sel <= '0';
            temp2_ld <= '0';
            j_sel <= '0';
            j_ld <= '0';
            count_ld <= '0';
            v_sel <= '0';
            v_ld <= '0';
            w_sel <= '0';
            w_ld <= '0';
            parent_wr <= '0';
            parentaddr_sel <= '0';
            p1_ld <= '0';
            p2_ld <= '0';
            edgelist_wr <= '0';
            i_sel <= "01";
            edgelistaddr_sel <= "00";
            next_state <= s12;
        end case;
    end process;
end rtl;

