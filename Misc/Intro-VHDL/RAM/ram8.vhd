library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram8 is
	port(
        i       : in  std_logic_vector(15 downto 0);
        address : in  std_logic_vector( 2 downto 0);
		en      : in  std_logic;
        clk     : in  std_logic;
		o       : out std_logic_vector(15 downto 0)
	);
end entity ram8;

architecture rtl of ram8 is
    signal r1, r2, r3, r4, r5, r6, r7, r8 : std_logic;
    signal ro1, ro2, ro3, ro4, ro5, ro6, ro7, ro8 : std_logic_vector(15 downto 0);
begin
    dmux8way_1   : entity work.dmux8way   port map(en, address, r1, r2, r3, r4, r5, r6, r7, r8);
    register16_1 : entity work.register16 port map(i, r1, clk, ro1);
    register16_2 : entity work.register16 port map(i, r2, clk, ro2);
    register16_3 : entity work.register16 port map(i, r3, clk, ro3);
    register16_4 : entity work.register16 port map(i, r4, clk, ro4);
    register16_5 : entity work.register16 port map(i, r5, clk, ro5);
    register16_6 : entity work.register16 port map(i, r6, clk, ro6);
    register16_7 : entity work.register16 port map(i, r7, clk, ro7);
    register16_8 : entity work.register16 port map(i, r8, clk, ro8);
    mux8way16_1  : entity work.mux8way16  port map(r1o, r2o, r3o, r4o, r5o, r6o, r7o, r8o, address, o);
end rtl;