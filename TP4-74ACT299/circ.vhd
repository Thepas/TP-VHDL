--modelisation du circuit 74ACT299

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_Unsigned.all;
use ieee.numeric_std.all; 

entity circ IS 
  port(CP: in std_logic;
      MR_Bar,DS0, DS7: in std_logic;
      OE_Bar: in std_logic_vector (1 downto 0);
      S: in std_logic_vector (1 downto 0);
      IO: INOUT std_logic_vector (7 downto 0);
      Q7, Q0: out std_logic
    );
end circ;
        
        
architecture circ_arch of circ IS
  signal tmp: std_logic_vector (7 downto 0);
begin
--operation de décalage
  process (MR_Bar,CP)
    begin
      If MR_Bar='0'  then 
        tmp<="00000000";
      end if;
      
      if (CP'event and CP = '1' and MR_Bar /= '0') then
        if S="00" then 
         NULL;
        elsif S="01" then
          tmp <= tmp(6 downto 0) & DS7; --décallage à gauche
        
        elsif S="10" then
          tmp <= DS0 & tmp(7 downto 1); -- décallage à droite
        
        elsif S="11" then
          tmp <= IO;
      end if;
      end if;
end process;

---Laison de sortie haute impédance

process (OE_Bar,MR_Bar,tmp)
  begin 
    IF (OE_Bar ="01" or OE_Bar ="10" or OE_Bar ="11" or (OE_Bar ="00" AND S="11")) Then
      IO<= "ZZZZZZZZ";

    elsif (S="01" or S="10" or S="00"  or (OE_Bar = "00"  AND S /="11")) Then
    IO<=tmp;
end if;
end process;

Q0<= tmp(7);
Q7<= tmp(0);

end circ_arch;