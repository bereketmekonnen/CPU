library IEEE;
use IEEE.STD_LOGIC_1164.all;   
use ieee.numeric_std.all;

entity Decoder is
    Port ( 	small   : in	std_logic_vector(2 downto 0);				 									--opcode
			RegSthw,regWrite, alu_1, alu_2,alu_3, aluSrc, memToReg, memToRead, memToWrite  : out std_logic ); 		--contorl lines
end Decoder;

architecture Structural of Decoder is  
subtype QWord is std_logic_vector(0 to 8);		 -- both dementions of the array were backwards so i flipped the deffinitions of the arrays on both
type LUT is array(0 to 7) of Qword;
constant tempF : LUT:= ( b"000001000",b"000011000",b"000100000",b"000110000",b"001001000",b"011010000",b"101100001",b"011110110" );	 --2D array of contole line flags 

begin 	
	
	
	
--	tempF (7 downto 0) <= b"00001000" when small = "000";	   0--signed addition						   								--R type		  reg
--	tempF (7 downto 0) <= b"00011000" when small = "001";	   1--signed multiplication					   								--R type		  reg
--	tempF (7 downto 0) <= b"00100000" when small = "010";	   2--pass A		//never happens	independently 	//store half word tho  	--i type
--	tempF (7 downto 0) <= b"00110000" when small = "011";	   3--pass B		//never happens	independently 	//load immediate tho  	--i type
--	tempF (7 downto 0) <= b"01001000" when small = "100";	   4--signed subtraction   					   								--R type		  reg
--	tempF (7 downto 0) <= b"10110000" when small = "101";	   5--load immediate	   	  	val to reg	   								--i type		  reg
--	tempF (7 downto 0) <= b"01100001" when small = "110";	   6--store half-word			reg to mem	   								--i type
--	tempF (7 downto 0) <= b"11110110" when small = "111";	   7--load halfword				mem to reg	   								--i type		  reg
--		
	   RegSthw		<= tempF(to_integer(unsigned(small)))(0);
	   regWrite 	<= tempF(to_integer(unsigned(small)))(1);  --setting the bit of the 2D array to the control line
	   alu_1 		<= tempF(to_integer(unsigned(small)))(2);  --setting the bit of the 2D array to the control line
	   alu_2 		<= tempF(to_integer(unsigned(small)))(3);  --setting the bit of the 2D array to the control line
	   alu_3 		<= tempF(to_integer(unsigned(small)))(4);  --setting the bit of the 2D array to the control line
	   aluSrc 		<= tempF(to_integer(unsigned(small)))(5);  --setting the bit of the 2D array to the control line
	   memToReg 	<= tempF(to_integer(unsigned(small)))(6);  --setting the bit of the 2D array to the control line
	   memToRead 	<= tempF(to_integer(unsigned(small)))(7);  --setting the bit of the 2D array to the control line
	   memToWrite 	<= tempF(to_integer(unsigned(small)))(8);  --setting the bit of the 2D array to the control line
	   
	
end Structural;