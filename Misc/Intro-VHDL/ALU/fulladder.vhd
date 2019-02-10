library ieee;
use ieee.std_logic_1164.all;
 
entity fulladder is
    port (
        a     : in  std_logic;
        b     : in  std_logic;
        c     : in  std_logic;
        sum   : out std_logic;
        carry : out std_logic
    );
end fulladder;
 
architecture rtl of fulladder is
    signal sum1, carry1, carry2 : std_logic;
begin
   halfadder_1 : entity work.halfadder port map(a, b, sum1, carry1);
   halfadder_2 : entity work.halfadder port map(c, sum1, sum, carry2);
   or_1 :        entity work.or_gate   port map(carry1, carry2, carry);
end rtl;