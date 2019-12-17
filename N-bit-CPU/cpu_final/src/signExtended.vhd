library IEEE;
use IEEE.STD_LOGIC_1164.all;   
use ieee.numeric_std.all;

entity signExtended is
    Port ( 	small   : in	std_logic_vector(7 downto 0);
			large   : out std_logic_vector (15 downto 0) );   --16bit 
end signExtended;

architecture Structural of signExtended is  
	 constant pad : std_logic_vector(7 downto 0):= (others => '0');
	begin 
			large <= pad&small;
end Structural;