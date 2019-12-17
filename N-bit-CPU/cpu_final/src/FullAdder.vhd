library IEEE;
use IEEE.STD_LOGIC_1164.all;   
Library work;
use work.ArrayPKG.all;	
use work.Declaration.all;

entity FullAdder is
    Port ( A  , B , CarryIn : in  STD_LOGIC;    -- XOR gate input
          Sum , CarryOut    : out STD_LOGIC);    -- XOR gate output
end FullAdder;

architecture Structural of FullAdder is
 

signal S, Cin, Cout0,Cout1 : std_logic;

begin 	 

Half_Adder0: HalfAdder port map(A, B, S , Cout0);
Half_Adder1: HalfAdder port map(CarryIn, S, Sum, Cout1);
OR_Gate0: OrGate port map( Cout0, Cout1, CarryOut); 
	


end Structural;