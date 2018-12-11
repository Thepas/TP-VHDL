-- cnteur synchrone par 10 (0 à 9)
--melange sequentielle et combinatoire

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity count4 is
	port(
		clk, EN : in std_logic;	-- Le cnteur ne s'incrémente si EN = 1 // Signal d'horloge // stop pour arrêter
		CLR : in std_logic;	--  remise à 0
		q10 : out std_logic_vector(3 downto 0); -- sortie sur 4 bits contenant le digit
		q : out std_logic_vector(3 downto 0)
	);
end count4;

architecture count4_a of count4 is

signal cnt10 : integer range 0 to 10;
signal cnt : integer range 0 to 10;

begin
	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(CLR = '1') then
			
				cnt10 <= 0;
				cnt <= 0;
				
			elsif(EN = '1') then	
			
				if(cnt10 = 9 and cnt/=9) then --condition pour incrémenter 1 aux dizaines
					cnt10 <= 0;
					cnt <= cnt + 1;
				elsif(cnt10/=9) then    --condition pour incrémenter 1 aux unité
					cnt10 <= cnt10 + 1;
			
				
				
			elsif (cnt=9 and cnt10=9) then --conditon pour recommencer le cntage
					cnt<=0;
					cnt10<=0;	
			end if;
		   end if;
		end if;
	end process;

	-- Conversion des variables integer cnt/cnt10 en std_logic_vector de 4 bits
	
	with cnt10 select
		q10 <= "0000" when 0,
			"0001" when 1,
			"0010" when 2,
			"0011" when 3,
			"0100" when 4,
			"0101" when 5,
			"0110" when 6,
			"0111" when 7,
			"1000" when 8,
			"1001" when 9,
			"0000" when others;	-- Si au dessus de 9, on renvoie en sortie 0
			
	with cnt select
		q<= "0000" when 0,
			"0001" when 1,
			"0010" when 2,
			"0011" when 3,
			"0100" when 4,
			"0101" when 5,
			"0110" when 6,
			"0111" when 7,
			"1000" when 8,
			"1001" when 9,
			"0000" when others;
end count4_a;