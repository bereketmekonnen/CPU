library IEEE;	  																					  
use IEEE.STD_LOGIC_1164.all;	 	
use ieee.numeric_std.all;  
LIbrary work;
use work.ArrayPKG.all;

entity InstrMem is	

    Port (
		   Load      : in std_logic;
		   PC        : in  std_logic_vector(15 downto 0);    
		   Programer : in InstArray;
		   Instr     : out  std_logic_vector(15 downto 0)
	);  
        
end InstrMem;

architecture Structural of InstrMem is 
signal tmp_instr :std_logic_vector(15 downto 0)  ;
begin 	
Instruction <= Programer ;		-- programs the instruction memory with instructions 	
Instr <=Instruction(to_integer(signed(PC))/4)when Load <= '0' else (others => 'U') when Load = '1';
  
end Structural;