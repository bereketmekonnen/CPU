library IEEE;
use IEEE.STD_LOGIC_1164.all;	 	
use ieee.numeric_std.all;
LIbrary work;
use work.ArrayPKG.all;

entity RegFile is	
    Port ( Rs,Rt,WrAddr : in  std_logic_vector(3 downto 0);    -- Rs, Rt, Write Address
		   WrDat        : in std_logic_vector(15 downto 0); --Write Data
		   RegWr,RegSthw        : in  std_logic;  
		   R1,R2        : out std_logic_vector(15 downto 0)-- R1, R2
		   
	);   
        
end RegFile;

architecture Structural of RegFile is 

begin 		 
	


RegisterData(to_integer(unsigned(WrAddr))) <= WrDat ; -- loads data from Data memory into the resgistar file when RegWr = 1
R1 <=  (others=> 'U') when RegWr = '1' else RegisterData(to_integer(unsigned(Rs))) when RegWr = '0';  -- looks up what is in Rs
R2 <=  (others=> 'U') when RegWr = '1' else RegisterData(to_integer(unsigned(WrAddr)))when RegSthw = '1' and RegWr = '0' else RegisterData(to_integer(unsigned(Rt)))  when RegWr'event and RegWr = '0'  ;  -- looks up what is in Rt 

--	   
end Structural;