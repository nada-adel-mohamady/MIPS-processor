library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory is 
port(	
  reset, clk: in std_logic;
<<<<<<< HEAD
	EX_MEM:in std_logic_vector(105 downto 0);

  Rsrc2,ALUresult, MemoryReuslt :out std_logic_vector(31 downto 0);
  SWAP :out std_logic;
  Rs,Rd,WBsignals :out std_logic_vector(3-1 downto 0)
=======
	EX_MEM:in std_logic_vector(114 downto 0);

  Rsrc2,ALUresult, MemoryReuslt :out std_logic_vector(31 downto 0);
  SWAP :out std_logic;
  Rs,Rd,WBsignals :out std_logic_vector(2 downto 0)
>>>>>>> 8196e8d787ba1f88a9b1660a68eb819caf1de23b
);
end entity;

architecture memory_arch of memory is
 
<<<<<<< HEAD
  signal Rsrc2:std_logic_vector(31 downto 0);
	signal SWAP, interrupt,RRI,CRR:  std_logic;
	signal MEMsignals : std_logic_vector(3-1 downto 0);
=======
	signal interrupt,RRI:  std_logic;
	signal MEMsignals: std_logic_vector(3 downto 0);
	signal CRR : std_logic_vector(2 downto 0);
>>>>>>> 8196e8d787ba1f88a9b1660a68eb819caf1de23b
	signal spType :std_logic_vector(2-1 downto 0);
	signal Address : std_logic_vector(31 downto 0);
	
  
begin
  
Rsrc2 <= EX_MEM( 31 downto 0);
SWAP<= EX_MEM(32);
Rs <= EX_MEM( 35 downto 33);
ALUresult<= EX_MEM( 67 downto 36);
Address<= EX_MEM( 99 downto 68);
Rd<= EX_MEM( 102 downto 100);
interrupt<= EX_MEM(103);
RRI<= EX_MEM(104);
CRR<= EX_MEM(107 downto 105);
MEMsignals<=EX_MEM(111 downto 108);
<<<<<<< HEAD
WBsignals<=(114 downto 112);
=======
WBsignals<=EX_MEM(114 downto 112);
>>>>>>> 8196e8d787ba1f88a9b1660a68eb819caf1de23b
MemoryReuslt<=(others=>'0');

end architecture;




