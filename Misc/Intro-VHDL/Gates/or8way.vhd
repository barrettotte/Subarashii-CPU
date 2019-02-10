library ieee;
use ieee.std_logic_1164.all;
 
entity or8way is
    port (
        a : in  std_logic_vector(7 downto 0);
        o : out std_logic
    );
end or8way;
 
architecture rtl of or8way is
    signal a_01, a_23, a_45, a_67, out_0123, out_4567 : std_logic;
begin
    or_1 : entity work.or_gate port map(a(0), a(1), a_01);
    or_2 : entity work.or_gate port map(a(2), a(3), a_23);
    or_3 : entity work.or_gate port map(a(4), a(5), a_45);
    or_4 : entity work.or_gate port map(a(6), a(7), a_67);
    or_5 : entity work.or_gate port map(a_01, a_23, out_0123);
    or_6 : entity work.or_gate port map(a_45, a_67, out_4567);
    or_7 : entity work.or_gate port map(out_0123, out_4567, o);
end rtl;