LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


ENTITY count3 IS
  port(clk, clear, load, ud: in std_logic;
    val: in INTEGER;
    qc: out INTEGER RANGE 0 TO 255);
  
END count3;

ARCHITECTURE behavioral OF count3 IS
BEGIN
  
  PROCESS (clk, clear, ud, load)
    
    VARIABLE cnt: INTEGER RANGE 0 TO 255;
    
    BEGIN
      
        
      IF (clk'EVENT AND clk = '1') THEN
        
        IF load = '1' THEN
          cnt:= val;
          
        ELSIF load = '0' THEN
          
                  IF clear = '0' THEN
                  cnt:=0;
                  
                  ELSIF clear = '1' THEN
           
                      IF (ud = '0' AND cnt < 255) THEN
                        cnt:= cnt + 1;
                      ELSIF(cnt > 255) THEN
                        cnt:=0;
                      ELSE
                         IF cnt > 0 THEN
                          cnt:= cnt - 1;
                          ELSE 
                          cnt:=0;
                          END IF;
                       END IF;
   
                  END IF;
        END IF;
  END IF;
    qc<= cnt;
 
END PROCESS;
END behavioral;
