library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram16K is
	port(
        i       : in  std_logic_vector(15 downto 0);
        address : in  std_logic_vector(11 downto 0);
		en      : in  std_logic;
        clk     : in  std_logic;
		o       : out std_logic_vector(15 downto 0)
	);
end entity ram16K;

architecture rtl of ram16K is
    signal r1, r2, r3, r4, r5, r6, r7, r8 : std_logic;
    signal ro1, ro2, ro3, ro4, ro5, ro6, ro7, ro8 : std_logic_vector(15 downto 0);
begin
    dmux8way_1  : entity work.dmux8way  port map(en, address(13 downto 12), r1, r2, r3, r4, r5, r6, r7, r8);
    ram4K_1     : entity work.ram4K     port map(i, r1, clk, addr(11 downto 0) ro1);
    ram4K_2     : entity work.ram4K     port map(i, r2, clk, addr(11 downto 0) ro2);
    ram4K_3     : entity work.ram4K     port map(i, r3, clk, addr(11 downto 0) ro3);
    ram4K_4     : entity work.ram4K     port map(i, r4, clk, addr(11 downto 0) ro4);
    ram4K_5     : entity work.ram4K     port map(i, r5, clk, addr(11 downto 0) ro5);
    ram4K_6     : entity work.ram4K     port map(i, r6, clk, addr(11 downto 0) ro6);
    ram4K_7     : entity work.ram4K     port map(i, r7, clk, addr(11 downto 0) ro7);
    ram4K_8     : entity work.ram4K     port map(i, r8, clk, addr(11 downto 0) ro8);
    mux8way16_1 : entity work.mux8way16 port map(r1o, r2o, r3o, r4o, r5o, r6o, r7o, r8o, address(13 downto 12), o);
end rtl;