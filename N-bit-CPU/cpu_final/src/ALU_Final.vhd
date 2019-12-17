library IEEE;
use IEEE.std_logic_1164.all; 
library Work; 
use Work.ArrayPKG.all;
use Work.Declaration.all;

entity ALU_Final is
	port (A,B: 						in     	std_logic_vector (15 downto 0);	
		  s0,s1,s2:					in 		std_logic; 
		  overflow,zero,negitive:	out		std_logic;
		  Answer:			 		out		std_logic_vector (15 downto 0));
end ALU_Final;

architecture circit of ALU_Final is

signal J,K,L: std_logic_vector(15 downto 0) := (others => '1') ;
signal OVRA,NEGA,OVRM,NEGM,OVRS,NEGS: std_logic := 'Z';
signal Z: std_logic_vector(15 downto 0) := (others => 'Z') ;
signal tmp_b,tmp_a : std_logic_vector(15 downto 0);	
signal U : std_logic_vector(15 downto 0):= (others => 'U');
begin	   		  


	action0: NBitAdder	     generic map(N => 16)		port map (A,B,	OVRA,NEGA,open,		J);	--000
	action1: NBitMultiplier  generic map(N => 16)	    port map (A,B,	OVRM,NEGM,open,		K);-- 001
--	action2: A																				   -- 010
--	action3: B																				   -- 011
	action4: NBitSubstractor 	generic map(N => 16) port map (A,B,	OVRS,NEGS,zero,	L);		   -- 100
--	action5: Load I  (Just pass B)																			   -- 101
--	action6: Store Half Word (Just Pass B)																				   -- 111
--	action7: Load Half Word (Just Pass A)
	muxing: MUXALU port map(J,K,A,B,L,B,B,B,	s0,s1,s2,	answer); 
	Flags:	Fs_ALU port map(s0,s1,s2,	OVRA,NEGA,OVRM,NEGM,OVRS,NEGS,	overflow,negitive);

end circit;