library IEEE;
use IEEE.std_logic_1164.all; 
LIbrary work;
use work.ArrayPKG.all;	 
use work.Declaration.all;

entity MUXALU is
	port (A,B,C,D,E,F,G,H: 			in     	std_logic_vector (15 downto 0);	
          s0,s1,s2:					in 		std_logic;
		  Answer:			 		out		std_logic_vector (15 downto 0));
end MUXALU;

architecture circit of MUXALU is

	
	signal s0N,s1N,s2N: std_logic ;
	signal A0,A1,A2,A3,A4,A5,A6,A7: std_logic_vector(15 downto 0);
begin	   		  
	
	n0: NotGate port map (s0, s0N);
	n1: NotGate port map (s1, s1N);
	n2: NotGate port map (s2, s2N); 
	
	and0:  andMUX port map (s0N,s1N,s2N, 	A,	A0);
	and1:  andMUX port map (s0N,s1N,s2, 	B,	A1);
	and2:  andMUX port map (s0N,s1,s2N, 	C,	A2);
	and3:  andMUX port map (s0N,s1,s2, 		D,	A3);
	and4:  andMUX port map (s0,s1N,s2N, 	E,	A4);
	and5:  andMUX port map (s0,s1N,s2, 		F,	A5);
	and6:  andMUX port map (s0,s1,s2N, 		G,	A6);
	and7:  andMUX port map (s0,s1,s2, 		H,	A7); 
	
	oring: MUXor port map (A0,A1,A2,A3,A4,A5,A6,A7, 	Answer)	;

end circit;