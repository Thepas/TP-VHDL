LIBRARY ieee  ; 
USE ieee.std_logic_1164.all  ; 
ENTITY count2ud_tb  IS 
END ; 
 
ARCHITECTURE count2ud_tb_arch OF count2ud_tb IS
  SIGNAL qc   :  INTEGER  ; 
  SIGNAL ud   :  STD_LOGIC:='0' ; 
  SIGNAL clk   :  STD_LOGIC:='0'  ; 
  SIGNAL clear   :  STD_LOGIC:='0'  ; 
  COMPONENT count2  
    PORT ( 
      qc  : out INTEGER ; 
      ud  : in STD_LOGIC ; 
      clk  : in STD_LOGIC ; 
      clear  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : count2  
    PORT MAP ( 
      qc   => qc  ,
      ud   => ud  ,
      clk   => clk  ,
      clear   => clear   ) ;
      
      clk<=not(clk) after 10 ns;
       clear<= '0','1' after 25 ns; 
       ud<= '0','1' after 200 ns,'0' after 400 ns,'1' after 6600 ns;
END ; 