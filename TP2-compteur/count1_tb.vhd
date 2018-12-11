LIBRARY ieee  ; 
USE ieee.std_logic_1164.all  ; 
ENTITY count1_tb  IS 
END ; 
 
ARCHITECTURE count1_tb_arch OF count1_tb IS
  SIGNAL qc   :  INTEGER ; 
  SIGNAL cnt   :  INTEGER  ; 
  SIGNAL clk   :  STD_LOGIC:='0' ; 
  SIGNAL clear   :  STD_LOGIC:='0' ; 
  COMPONENT count1  
    PORT ( 
      qc  : out INTEGER ; 
      cnt  : out INTEGER ; 
      clk  : in STD_LOGIC ; 
      clear  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : count1  
    PORT MAP ( 
      qc   => qc  ,
      cnt   => cnt  ,
      clk   => clk  ,
      clear   => clear  ) ; 
      
       clk<=not(clk) after 10 ns;
       clear<= '1' after 100 ns,'0' after 500 ns,'1' after 900 ns;
END ; 

