library IEEE;
use IEEE.std_logic_1164.all;

entity bit4Mux is
	port (A,B: 			in     	std_logic_vector (3 downto 0);	
          s0:			in 		std_logic;
		  Answer:		out		std_logic_vector (3 downto 0));
end bit4Mux;


architecture circit of bit4Mux is	 
begin
	process(A,B)   
	begin 
		if 	  (s0='1') then
				Answer <= transport A after 10 ns;
		else 
				Answer <= transport B after 10 ns;	 
		end if;
	end process;
end circit;	