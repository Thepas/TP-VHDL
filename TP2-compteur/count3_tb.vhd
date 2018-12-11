LIBRARY ieee  ; 
USE ieee.NUMERIC_STD.all  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_arith.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
ENTITY count3l_tb  IS 
END ; 
 
ARCHITECTURE count3l_tb_arch OF count3l_tb IS
  SIGNAL qc   :  INTEGER  ; 
  SIGNAL load   :  STD_LOGIC :='0' ; 
  SIGNAL ud   :  STD_LOGIC :='0' ; 
  SIGNAL clk   :  STD_LOGIC:='0'  ; 
  SIGNAL val   :  INTEGER  ; 
  SIGNAL clear   :  STD_LOGIC:='0'  ; 
  COMPONENT count3  
    PORT ( 
      qc  : out INTEGER ; 
      load  : in STD_LOGIC ; 
      ud  : in STD_LOGIC ; 
      clk  : in STD_LOGIC ; 
      val  : in INTEGER ; 
      clear  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : count3  
    PORT MAP ( 
      qc   => qc  ,
      load   => load  ,
      ud   => ud  ,
      clk   => clk  ,
      val   => val  ,
      clear   => clear   ) ; 
      
       clk<=not(clk) after 10 ns;
       clear<= '0','1' after 50 ns,'0' after 120 ns,'1' after 150 ns; 
       ud<= '0','1' after 200 ns,'0' after 400 ns,'1' after 600 ns;
       val<=25;
       load<='0','1' after 100 ns, '0' after 115 ns, '1' after 210 ns, '0' after 225 ns;

      
END ; 


