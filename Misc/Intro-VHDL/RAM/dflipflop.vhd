library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dflipflop is
	port(
		clk : in  std_logic;
		rst : in  std_logic;
		en  : in  std_logic;
		d   : in  std_logic;
		q   : out std_logic;
		nq  : out std_logic
	);
end entity dflipflop;

architecture rtl of dflipflop is
	signal val : std_logic := '0';
	signal nxt : std_logic := '0';
begin
	process(clk, rst)
	begin
		if(rst = '1') then
		    val <= '0';
		elsif(clk'event and clk = '1') then
			val <= nxt;
		end if;
	end process;

	nxt <= d when en = '1' else val;		-- Next state
	q   <= val;								-- Output
	nq  <= not val; 
end rtl;