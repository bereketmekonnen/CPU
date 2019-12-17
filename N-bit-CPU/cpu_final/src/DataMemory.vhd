library IEEE;
use IEEE.STD_LOGIC_1164.all;	 	
use ieee.numeric_std.all;
LIbrary work;
use work.ArrayPKG.all;

entity DatMem is	
    Port ( Addr,WrData       : in  std_logic_vector(15 downto 0);    --  Write Address	, Write Data
		   MemRd, MemWr      : in std_logic; --Memory Read, Memory Write 
		   ReadData          : out std_logic_vector(15 downto 0)-- Read Data
	);   
        
end DatMem;

architecture Structural of DatMem is 

begin 		 
	
ReadData <= DataMemory(to_integer(unsigned(Addr))) when MemRd = '1' else (others => 'U');	

DataMemory(to_integer(unsigned(Addr))) <= WrData when MemWr = '1' else (others => 'U'); 



	   
end Structural;