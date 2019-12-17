library IEEE;
use IEEE.std_logic_1164.all;

entity andMUX is
	port (A,B,C: 	in std_logic;
		  D:		in std_logic_vector(15 downto 0);
		  output: 	out std_logic_vector(15 downto 0));
end andMUX;

architecture circit of andMUX is	 
signal Z: std_logic_vector(15 downto 0) := (others => 'Z') ;
begin
	process(A,B,C,D)   
	begin 
		if 	  (A='1' and B='1' and C='1') then
				output <= transport D after 10 ns;
		else 
				output <= transport Z after 10 ns;	 
		end if;
	end process;
end circit;