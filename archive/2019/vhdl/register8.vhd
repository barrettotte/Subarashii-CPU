library ieee;
use ieee.std_logic_1164.all;

entity register8 is
	port(
		i    : in  std_logic_vector(7 downto 0);
        en   : in  std_logic;
        load : in  std_logic;
        clr  : in  std_logic;
		clk  : in  std_logic;
		o    : out std_logic_vector(7 downto 0)
	);
end entity register8;

architecture rtl of register8 is
	signal val : std_logic_vector(7 downto 0);
begin
	process(clk)
	begin
		if(clk'event and clk = '1' and en = '1') then
			val <= i;
		end if;
	end process;
	o <= val;
end rtl;