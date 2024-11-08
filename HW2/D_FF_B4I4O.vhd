library ieee;
use ieee.std_logic_1164.all;

entity D_FF_B4I4O is
port(
	clk:in std_logic;
	Din:in std_logic_vector(3 downto 0);
	Dout:out std_logic_vector(3 downto 0));
end D_FF_B4I4O;

architecture main of D_FF_B4I4O is
signal Q:std_logic_vector(3 downto 0);
begin
	process(clk,Q)
	begin
		if rising_edge(clk) then
			Q <= Din;
		end if;
		Dout <= Q;
	end process;
end main;