library IEEE;
use IEEE.std_logic_1164.all;

entity MUXor is
	port (A,B,C,D,E,F,G,H:		in std_logic_vector(15 downto 0);
		  output: 				out std_logic_vector(15 downto 0));
end MUXor;

architecture circit of MUXor is	 
signal Z: std_logic_vector(15 downto 0) := (others => 'Z') ;	  
begin 
	process(A,B,C,D,E,F,G,H)   
	begin 
		if 	  (A /= Z) then
			output <= transport A after 10 ns;
		elsif (B /= Z) then
			output <= transport B after 10 ns;
		elsif (C /= Z) then
			output <= transport C after 10 ns;
		elsif (D /= Z) then
			output <= transport D after 10 ns;
		elsif (E /= Z) then
			output <= transport E after 10 ns;
		elsif (F /= Z) then
			output <= transport F after 10 ns;
		elsif (G /= Z) then
			output <= transport G after 10 ns;
		elsif (H /= Z) then
			output <= transport H after 10 ns;
		else 
			output <= transport Z after 10 ns;	 
		end if;
	end process;
end circit;