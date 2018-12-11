LIBRARY IEEE;
use IEEE.std_logic_1164.all;

ENTITY count1 IS
  port(clk, clear: in std_logic;
    qc, cnt:  OUT integer);
END count1;

ARCHITECTURE behavioral OF count1 IS
BEGIN

PROCESS (clk)
  
  VARIABLE cnt: INTEGER RANGE 0 TO 255;
  
BEGIN 
     

        IF (clk 'EVENT AND clk = '1') THEN
                IF clear = '0' THEN
                        cnt:= 0;
                ELSE 
                  IF cnt<255 THEN
                        cnt:= cnt+1;
                  ELSE 
                  cnt:= 0;
                 END IF;
                END IF;
         END IF;
         qc<= cnt;
         
        END PROCESS;
        
END behavioral;
