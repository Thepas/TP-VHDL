LIBRARY ieee  ; 
USE ieee.NUMERIC_STD.all  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
ENTITY circ_tb  IS 
END ; 
 
ARCHITECTURE circ_tb_arch OF circ_tb IS
  SIGNAL MR_Bar   :  STD_LOGIC:='0'  ;
  SIGNAL CP   :  STD_LOGIC:='0'  ;
  SIGNAL S   :  std_logic_vector (1 downto 0)  ; 
  SIGNAL OE_Bar   :  std_logic_vector (1 downto 0)  ; 
  SIGNAL IO   :  std_logic_vector (7 downto 0)  ; 
  SIGNAL Q7   :  STD_LOGIC  ;
  SIGNAL Q0   :  STD_LOGIC  ;
  SIGNAL DS7   :  STD_LOGIC  ; 
  SIGNAL DS0   :  STD_LOGIC  ; 

  COMPONENT circ  
    PORT ( 
      Q7  : out STD_LOGIC ; 
      IO  : inout std_logic_vector (7 downto 0) ; 
      OE_Bar  : in std_logic_vector (1 downto 0) ; 
      Q0  : out STD_LOGIC ; 
      DS7  : in STD_LOGIC ; 
      S  : in std_logic_vector (1 downto 0) ; 
      DS0  : in STD_LOGIC ; 
      MR_Bar  : in STD_LOGIC ; 
      CP  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : circ  
    PORT MAP ( 
      Q7   => Q7  ,
      IO   => IO  ,
      OE_Bar   => OE_Bar  ,
      Q0   => Q0  ,
      DS7   => DS7  ,
      S   => S  ,
      DS0   => DS0  ,
      MR_Bar   => MR_Bar  ,
      CP   => CP   ) ; 
      
      CP<=not(CP) after 10 ns;
      MR_Bar<= '0', '1' after 15 ns, '0' after 210 ns;
      S<= "00", "01" after 20 ns, "10" after 70 ns, "11" after 120 ns, "00" after 200 ns;
      DS7<= '1';
      DS0<= '1';
      OE_Bar<= "00";
      
      
      
END ; 

