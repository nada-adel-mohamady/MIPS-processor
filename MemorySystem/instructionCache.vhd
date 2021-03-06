LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

entity InstrCache is
  port (
    clk,BusRead,BusWrite,CacheRead:IN std_logic;
    index : IN  std_logic_vector(4 DOWNTO 0);
    Offset: IN std_logic_vector(2 downto 0);
    Counter:IN std_logic_vector(1 downto 0);
    dataout : OUT std_logic_vector(31 DOWNTO 0);
    BusDataIN:IN std_logic_vector(127 downto 0);
    BusDataOUT:OUT std_logic_vector(127 downto 0));
end InstrCache ;

architecture arch of InstrCache is
signal W,R:std_logic;
signal CurrentOffset:std_logic_vector(3 downto 0);
signal ActualOffset:std_logic_vector(2 downto 0);
signal CacheDataIn,CacheDataOut:std_logic_vector(31 downto 0);
signal BusDataSection:std_logic_vector(31 downto 0);
begin
W<= BusRead;
R<= BusWrite or CacheRead;
CacheDataIn<=BusDataSection when BusRead ='1';
dataout <= CacheDataOut when CacheRead ='1';   

dataCache:entity work.cache generic map(n=>2) port map(CLK=>clk,W=>W,R=>R,
index=>index,Offset=>ActualOffset,dataIn =>CacheDataIn
,dataOut=>CacheDataOut);

CurrentOffset<=std_logic_vector(unsigned(Offset)+(unsigned(counter)*2));
ActualOffset<=CurrentOffset(2 downto 0);


BusDataSection<=BusDataIN(31 downto 0) when  counter ="00" and BusRead ='1' else 
BusDataIN(63 downto 32) when  counter ="01" and BusRead ='1' else
BusDataIN(95 downto 64)  when  counter ="10" and BusRead ='1' else
BusDataIN(127 downto 96) when  counter ="11" and BusRead ='1' ;


BusDataOUT(31 downto 0)<=BusDataSection when counter ="00" and BusWrite = '1';
BusDataOUT(63 downto 32)<=BusDataSection when counter ="01" and BusWrite = '1';
BusDataOUT(95 downto 64)<=BusDataSection when counter ="10" and BusWrite = '1';
BusDataOUT(127 downto 96)<=BusDataSection when counter ="11" and BusWrite = '1';


end architecture ; -- arch