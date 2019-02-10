library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register16 is
	port(
		i   : in  std_logic_vector(15 downto 0);
		en  : in  std_logic;
		clk : in  std_logic;
		o   : out std_logic_vector(15 downto 0)
	);
end entity register16;

architecture rtl of register16 is
	signal val : std_logic_vector(15 downto 0);
begin
	process(clk)
	begin
		if(clk'event and clk = '1' and en = '1') then
			val <= i;
		end if;
	end process;
	o <= val;
end rtl;