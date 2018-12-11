-- Generateur de nombres - suite de fibonacci
-- 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610 ... 
 
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_Unsigned.all;
use ieee.numeric_std.all; 
 
entity gen_fib_1 is 
   port ( 
      clk : in std_logic; 
      EN : in std_logic;
      INIT : in std_logic;
      N : in integer; 
      result : out std_logic_vector(15 downto 0); 
      overflow : out std_logic 
   ); 
end gen_fib_1; 
 
architecture fib_arch of gen_fib_1 is 
   signal val_1 : unsigned(15 downto 0); --la dernière valeur
   signal val_2 : unsigned(15 downto 0);  --valeur actuelle
   signal val_0 : std_logic;
   signal sum : unsigned(15 downto 0); --la somme 
begin 
   -- on stocke la valeur actuelle 
   process (clk,val_2) 
   begin 
      if (clk'event and clk = '1') then 
         if (EN = '1' and INIT = '1') then 
            val_2 <= to_unsigned(1, 16); 
         else 
            val_2 <= sum; 
         end if; 
      end if; 
   end process; 
 
   -- on stocke la dernière valeur 
   process (clk) 
   begin 
      if (clk'event and clk = '1') then 
         if (EN = '1') then 
            val_1 <= (others => '0'); 
         else 
            val_1 <= val_2; 
         end if; 
      end if; 
   end process; 


   -- on additionne
   sum <= val_1 + val_2; 
 
   result <= std_logic_vector(val_1(15 downto 0)); 

   process (clk,val_2,val_1)
   begin
     if (clk'event and clk = '1') then 
	if (val_2 < val_1) then
  		 val_0 <= '1';           
        end if;	
     end if;
   end process;


overflow <= val_0; --on regarde l'état de la suite avec overflow
 
end fib_arch; 