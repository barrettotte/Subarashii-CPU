library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity programcounter is
	port(
		clk : in  std_logic;
		rst : in  std_logic;
        en  : in  std_logic;
        inc : in  std_logic;
		i   : in  std_logic_vector(15 downto 0);
		o   : out std_logic_vector(15 downto 0);
	);
end entity programcounter;

architecture rtl of programcounter is
	signal val : std_logic_vector(15 downto 0) := "0000000000000000";
	signal nxt : std_logic_vector(15 downto 0) := "0000000000000001";
begin
    inc16_1 : entity work.inc16 port map(val, nxt);
    o <= val;

	process(clk, rst)
	begin
		if(rst = '1') then
		    val <= "0000000000000000";
        elsif(clk'event and clk = '1') then
            if(en = '1') then
                val <= i;
            elsif(inc = '1') then
                val <= nxt;
		end if;
	end process;
end rtl;