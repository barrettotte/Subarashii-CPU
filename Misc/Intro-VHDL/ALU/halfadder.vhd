library ieee;
use ieee.std_logic_1164.all;
 
entity halfadder is
    port (
        a     : in  std_logic;
        b     : in  std_logic;
        sum   : out std_logic;
        carry : out std_logic
    );
end halfadder;
 
architecture rtl of halfadder is
begin
   and_1 : entity work.and_gate port map(a, b, carry);
   xor_1 : entity work.xor_gate port map(a, b, sum);
end rtl;