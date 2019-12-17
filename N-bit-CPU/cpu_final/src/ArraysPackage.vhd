library IEEE;	  
use IEEE.std_logic_1164.all;
package ArrayPKG is
	
subtype Index is std_logic_vector(15 downto 0);
type InstArray is array(14  downto 0)   of Index;	
type RegisterFile   is array(7   downto 0)   of Index;
type DataMem   is array(255 downto 0)   of Index;
signal Instruction	: InstArray;
signal RegisterData	: RegisterFile;
signal DataMemory	: DataMem;	 




end package ArrayPKG; 

library IEEE;  
use IEEE.std_logic_1164.all;  
library Work;
use Work.ArrayPKG.all;
package Declaration is 

-- Component Declaration
component InstrMem
    Port ( Load: in std_logic;	PC: in  std_logic_vector(15 downto 0);	Programer : in InstArray;	Instr: out  std_logic_vector(15 downto 0));   
end component;	
	
component  programCounter
	    Port ( clk,reset : in std_logic;	PC : out std_logic_vector (15 downto 0));   --16bit 
end component; 

component Decoder
	  Port ( 	small   : in	std_logic_vector(2 downto 0);	RegSthw,regWrite, alu_1, alu_2,alu_3, aluSrc, memToReg, memToRead, memToWrite  : out std_logic ); 
end component;	

component DatMem
    Port ( Addr,WrData: in  std_logic_vector(15 downto 0);	MemRd, MemWr: in std_logic; ReadData: out std_logic_vector(15 downto 0));   
end component;

component signExtended
    Port ( 	small   : in	std_logic_vector(7 downto 0);	large   : out std_logic_vector (15 downto 0) );   --16bit 
end component;

component in2out1MUX
	port (A,B:in std_logic_vector (15 downto 0);	s0:in std_logic;	Answer:out std_logic_vector (15 downto 0));
end component; 

 component RegFile is	
    Port ( Rs,Rt,WrAddr: in  std_logic_vector(3 downto 0);	WrDat: in std_logic_vector(15 downto 0);	RegWr,RegSthw: in  std_logic;	R1,R2: out std_logic_vector(15 downto 0));        
end component;

component ALU_Final is
	port (A,B:in std_logic_vector (15 downto 0);	s0,s1,s2:in std_logic;	overflow,zero,negitive:	out std_logic;	Answer:out std_logic_vector (15 downto 0));
end component;	


component NBitAdder	
		   generic(N : integer)	;
		Port ( A  , B  : in  STD_LOGIC_VECTOR(N-1 downto 0);			Overflow,Negative,Zero : out std_logic;	Answer : out STD_LOGIC_VECTOR(N-1 downto 0);	CarryOut : out std_logic); 
end component;	 
component NBitSubstractor	  
		generic(N : integer)	;
		    Port ( A  , B  : in  STD_LOGIC_VECTOR(N-1 downto 0);  Overflow,Negative,Zero       : out std_logic; Answer         : out STD_LOGIC_VECTOR(N-1 downto 0));  
	 end component;

component NBitMultiplier 
		 generic(N : integer)	;
		    Port ( A  , B  : in  STD_LOGIC_VECTOR(N-1 downto 0);  Overflow,Negative,Zero       : out std_logic;	 	Answer         : out STD_LOGIC_VECTOR(N-1 downto 0));    
	 end component;	 

component MUXALU
		port (A,B,C,D,E,F,G,H: in std_logic_vector (15 downto 0);		s0,s1,s2: in std_logic;						Answer: out std_logic_vector (15 downto 0));
	 end component;
	 
	 component Fs_ALU
		port (s0,s1,s2: in std_logic;									OVRA,NEGA,OVRM,NEGM,OVRS,NEGS: in std_logic;	overflow,negitive: out std_logic);
	 end component ;   
component NOT2
			port (A: in std_logic; Z: out std_logic);
end component;	 

component OrGate 	 
	port(IN1,IN2 : in std_logic;
	O : out std_logic);	
end component;	  

component HalfAdder 	 
	port(A , B  : in std_logic;
	Sum, Cout : out std_logic);	
end component;	


	component NotGate
			port (IN1: in std_logic; O: out std_logic);
	end component;	 
	
	component andMUX
		port (A,B,C: in std_logic; 		D: in std_logic_vector(15 downto 0); 		output: out std_logic_vector(15 downto 0) );
	end component; 
	
	component MUXor
		port (A,B,C,D,E,F,G,H:	in std_logic_vector(15 downto 0);		output: out std_logic_vector(15 downto 0));
	end component;
component FullAdder 	 
	Port ( A  , B , CarryIn : in  STD_LOGIC;   -- XOR gate input
	Sum , CarryOut    : out STD_LOGIC
	);	
end component;	

component XorGate
	port(IN1, IN2 : in std_logic;
	     O        : out std_logic);
end component;

component XnorGate
	port(IN1, IN2 : in std_logic;
	     O        : out std_logic);
end component;

component AndGate
	port(IN1 , IN2 : in std_logic;
		O          : out std_logic);
end component;


	
	
end package Declaration; 