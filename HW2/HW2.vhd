library ieee;
use ieee.std_logic_1164.all;

entity HW2 is
port(
	clk:in std_logic;
	Din:in std_logic_vector(3 downto 0);
	A, B, C, D:out std_logic_vector(3 downto 0));
end HW2;

architecture main of HW2 is
type arr is array (0 to 4) of std_logic_vector(3 downto 0);
signal Q:arr;
begin
	process(clk,Q)
	
	begin
		if rising_edge(clk) then
			Q(0) <= Din;
			for i in 0 to 3 loop
				Q(i+1)<=Q(i);
			end loop;
		end if;
		D <= Q(1);
		C <= Q(2);
		B <= Q(3);
		A <= Q(4);
	end process;
end main;