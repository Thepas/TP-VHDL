LIBRARY ieee  ; 
USE ieee.NUMERIC_STD.all  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
ENTITY gen_fib_1_tb  IS 
END ; 
 
ARCHITECTURE gen_fib_1_tb_arch OF gen_fib_1_tb IS
  SIGNAL overflow   :  STD_LOGIC :='0' ; 
  SIGNAL INIT   :  STD_LOGIC :='0' ; 
  SIGNAL N   :  INTEGER  ; 
  SIGNAL clk   :  STD_LOGIC  ; 
  SIGNAL result   :  std_logic_vector (15 downto 0)  ; 
  SIGNAL EN   :  STD_LOGIC :='0' ; 
  COMPONENT gen_fib_1  
    PORT ( 
      overflow  : out STD_LOGIC ; 
      INIT  : in STD_LOGIC ; 
      N  : in INTEGER ; 
      clk  : in STD_LOGIC ; 
      result  : out std_logic_vector (15 downto 0) ; 
      EN  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : gen_fib_1  
    PORT MAP ( 
      overflow   => overflow  ,
      INIT   => INIT  ,
      N   => N  ,
      clk   => clk  ,
      result   => result  ,
      EN   => EN   ) ;
      
      testbench : process 
      procedure do_clk is 
      begin 
         clk <= '0'; 
         wait for 10 ns; 
         clk <= '1'; 
         wait for 10 ns; 
      end;

      variable result, UN, UN_1 : integer;  
   begin 
      do_clk; 
      EN <= '1';
      INIT <= '1'; 
      do_clk;
      EN <= '0';
      INIT <= '0';      
      UN := 1; 
      UN_1 := 0; 
      N <=256;
      for i in 1 to N loop 
         do_clk; 
         result := UN + UN_1; 
         UN_1 := UN; 
         UN := result; 
      end loop; 
   end process;  
END ; 

