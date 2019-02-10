library ieee;
use ieee.std_logic_1164.all;
 
entity add16 is
    port (
        a : in  std_logic_vector(15 downto 0);
        b : in  std_logic_vector(15 downto 0);
        o : out std_logic_vector(15 downto 0)
    );
end add16;
 
architecture rtl of add16 is
    signal sum, carries : std_logic_vector(15 downto 0);
begin
    -- Could be a for loop, but let's just stick with this...
    halfAdder_1  : entity work.halfadder port map(a(0),  b(0),  sum(0),  carries(0));
    fullAdder_1  : entity work.fulladder port map(a(1),  b(1),  carries(0),  sum(1),  carries(1));
    fullAdder_2  : entity work.fulladder port map(a(2),  b(2),  carries(1),  sum(2),  carries(2));
    fullAdder_3  : entity work.fulladder port map(a(3),  b(3),  carries(2),  sum(3),  carries(3));
    fullAdder_4  : entity work.fulladder port map(a(4),  b(4),  carries(3),  sum(4),  carries(4));
    fullAdder_5  : entity work.fulladder port map(a(5),  b(5),  carries(4),  sum(5),  carries(5));
    fullAdder_6  : entity work.fulladder port map(a(6),  b(6),  carries(5),  sum(6),  carries(6));
    fullAdder_7  : entity work.fulladder port map(a(7),  b(7),  carries(6),  sum(7),  carries(7));
    fullAdder_8  : entity work.fulladder port map(a(8),  b(8),  carries(7),  sum(8),  carries(8));
    fullAdder_9  : entity work.fulladder port map(a(9),  b(9),  carries(8),  sum(9),  carries(9));
    fullAdder_10 : entity work.fulladder port map(a(10), b(10), carries(9),  sum(10), carries(10));
    fullAdder_11 : entity work.fulladder port map(a(11), b(11), carries(10), sum(11), carries(11));
    fullAdder_12 : entity work.fulladder port map(a(12), b(12), carries(11), sum(12), carries(12));
    fullAdder_13 : entity work.fulladder port map(a(13), b(13), carries(12), sum(13), carries(13));
    fullAdder_14 : entity work.fulladder port map(a(14), b(14), carries(13), sum(14), carries(14));
    fullAdder_15 : entity work.fulladder port map(a(15), b(15), carries(14), sum(15), carries(15));
    o <= sum;
end rtl;