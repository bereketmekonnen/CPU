library IEEE;
use IEEE.std_logic_1164.all;  
library Work;
use Work.ArrayPKG.all;
use Work.Declaration.all;

entity Fs_ALU is
	port (s0,s1,s2: in std_logic;	
	OVRA,NEGA,OVRM,NEGM,OVRS,NEGS: in std_logic;	
	overflow,negitive: out std_logic);
end Fs_ALU;

architecture circit of Fs_ALU is

	
  signal selection: std_logic_vector(2 downto 0);
  signal Z: std_logic := 'Z';
begin	   		  
	process(s0,s1,s2)   
	begin 
		if 	  (s0='0' and s1='0' and s2='0') then
			overflow <= transport OVRA after 10 ns;
			negitive <= transport NEGA after 10 ns;
		elsif (s0='0' and s1='0' and s2='1') then
			overflow <= transport OVRM after 10 ns;
			negitive <= transport NEGM after 10 ns;
		elsif (s0='1' and s1='0' and s2='0') then
			overflow <= transport OVRS after 10 ns;
			negitive <= transport NEGS after 10 ns;	
		else 							
			overflow <= transport Z after 10 ns;
			negitive <= transport Z after 10 ns;	 
		end if;
	end process;
end circit;