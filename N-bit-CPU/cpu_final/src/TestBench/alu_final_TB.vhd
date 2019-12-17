library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity alu_final_tb is
end alu_final_tb;

architecture TB_ARCHITECTURE of alu_final_tb is
	-- Component declaration of the tested unit
	component alu_final
	port(
		A : in STD_LOGIC_VECTOR(15 downto 0);
		B : in STD_LOGIC_VECTOR(15 downto 0);
		s0 : in STD_LOGIC;
		s1 : in STD_LOGIC;
		s2 : in STD_LOGIC;
		overflow : out STD_LOGIC;
		zero : out STD_LOGIC;
		negitive : out STD_LOGIC;
		Answer : out STD_LOGIC_VECTOR(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(15 downto 0);
	signal B : STD_LOGIC_VECTOR(15 downto 0);
	signal s0 : STD_LOGIC;
	signal s1 : STD_LOGIC;
	signal s2 : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal overflow : STD_LOGIC;
	signal zero : STD_LOGIC;
	signal negitive : STD_LOGIC;
	signal Answer : STD_LOGIC_VECTOR(15 downto 0);		  

	-- Add your code here ...  
	subtype NumbBitsSel is std_logic_vector(2 downto 0); -- Number of Bits to describe operation 	
	subtype NumbBitsTest is std_logic_vector(15 downto 0);	-- Number of bits for Test Cases
	type    Operation is array(7 downto 0) of  NumbBitsSel; -- Numbers of operations 
	type    Test is array(7 downto 0) of NumbBitsTest;
	signal clk : std_logic:= '0';  -- clock of operation for alu
	Constant TestSel : Operation:= ("000","001","010","011","100","101","110","111");	 -- Select lines to be used to test inputs
	Constant TestALUin: Test:= (x"000A",x"000B", x"000F", x"0001", x"0003", x"000A", x"FFFA", x"FFFA");  -- Test cases for inputs to alu 	 
	Signal SelCounter, TestCounter : integer:= 0;	
	

begin

	-- Unit Under Test port map
	UUT : alu_final
		port map (
			A => A,
			B => B,
			s0 => s0,
			s1 => s1,
			s2 => s2,
			overflow => overflow,
			zero => zero,
			negitive => negitive,
			Answer => Answer
		);

	-- Add your stimulus here ... 		 
	process(clk)
	begin		  
		if clk'event and clk = '1' then	 
			if SelCounter <= 7 then 
			A<= TestALUin(TestCounter);	
			B<= TestALUin(TestCounter+1);  
			S0<= TestSel(SelCounter)(0);
			S1<= TestSel(SelCounter)(1);
			S2<= TestSel(SelCounter)(2);
			SelCounter <= SelCounter +1;
			
		
			    
		elsif ( SelCounter = 8) then 
			  
				TestCounter <= TestCounter +1;
				SelCounter <= 0;   
			
			
		end if;	-- clock upclock process
		
		end if;  -- clock not up clock 
		
		
	end process; 
	
	
	
	process(clk) 
	begin		
		clk <= not clk after 750ns;
		
	end process; 
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu_final of alu_final_tb is
	for TB_ARCHITECTURE
		for UUT : alu_final
			use entity work.alu_final(circit);
		end for;
	end for;
end TESTBENCH_FOR_alu_final;

