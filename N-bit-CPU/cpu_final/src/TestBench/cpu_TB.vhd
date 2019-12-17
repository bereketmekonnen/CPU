library cpu_final;
use cpu_final.ArrayPKG.all;
library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity cpu_tb is
end cpu_tb;

architecture TB_ARCHITECTURE of cpu_tb is
	-- Component declaration of the tested unit
	component cpu
	port(
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		Program : in InstArray );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC := '1';
	signal rst : STD_LOGIC:= '0';
	signal Program : InstArray;
	-- Observed signals - signals mapped to the output ports of tested entity
	constant data: InstArray:= (  X"770B", X"760A", X"640A", X"630B", X"4401", X"1301", X"0201", X"5700", X"5600", X"5500", X"5400", X"5300", X"5200", X"5105", X"500A");
	signal IM : InstArray;  
	signal RF : RegisterFile;
	signal DM : DataMem;
	signal setBack: integer := 0;

	
	
begin

	-- Unit Under Test port map
	UUT : cpu
		port map (
			clk => clk,
			rst => rst,
			Program => Program
		);

	-- Add your stimulus here ...

	Program <= data;
	IM <= Instruction;
   	RF <= RegisterData;
	DM <= DataMemory;


	process (clk) 
	begin
		clk <= not clk after 2000ns;
	end process;
	
	process(clk)
	begin 

		if clk'event and clk = '1' then	
		rst <= '0' after 40ns;	
		if setBack <= 13 then 
			rst <= '0';   
		if rst <= '0' then 
			setBack <=setback +1;	
		end if;
		
		else 
			setBack <= 0;
			rst <= '1';
		end if;
		end if;	  

			
	
	end process;
	
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_cpu of cpu_tb is
	for TB_ARCHITECTURE
		for UUT : cpu
			use entity work.cpu(structural);
		end for;
	end for;
end TESTBENCH_FOR_cpu;

