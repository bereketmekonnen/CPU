library IEEE;
use IEEE.std_logic_1164.all;

entity in2out1MUX is
	port (A,B: 			in     	std_logic_vector (15 downto 0);	
          s0:			in 		std_logic;
		  Answer:		out		std_logic_vector (15 downto 0));
end in2out1MUX;


architecture circit of in2out1MUX is	 
begin
	process(A,B)   
	begin 
		if 	  (s0='1') then
				Answer <= transport A ;
		else 
				Answer <= transport B ;	 
		end if;
	end process;
end circit;	