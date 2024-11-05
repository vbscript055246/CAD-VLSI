library IEEE;
use ieee.std_logic_1164.all;
entity HW3 is
port (
	clk, write_en: in std_logic;
	read_reg: in integer range 255 downto 0;
	write_reg: in integer range 255 downto 0;
	write_data: in std_logic_vector(7 downto 0);
	read_data: out std_logic_vector(7 downto 0));
end HW3;


architecture proc of HW3 is
	type storage is array (255 downto 0) of std_logic_vector(7 downto 0);
begin

	process(clk, read_reg, write_reg, write_en)
		variable my_register : storage;
	begin
	
	   read_data <= my_register(read_reg);
	   if (write_en='1' and (clk'EVENT and clk='1')) then
		  my_register(write_reg) := write_data;
	   end if;
	   
	end process;
	
end proc;
