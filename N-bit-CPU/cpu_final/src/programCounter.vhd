library IEEE;
use IEEE.STD_LOGIC_1164.all;   
use ieee.numeric_std.all;

entity programCounter is
    Port ( clk,reset : in std_logic;
	PC   : out std_logic_vector (15 downto 0));   --16bit 
end programCounter;

architecture Structural of programCounter is  
signal tmp_PC: integer:=0;
  


begin 
	
-- should output one instruction per clock cycle 
PC <= std_logic_vector(to_signed(tmp_PC,PC'length)) when reset = '0' else (others=>'0') when reset = '1'; 
tmp_PC <= tmp_PC + 4 when clk'event and clk = '1' and reset = '0' else 0 when reset = '1';
	
  
end Structural;