----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:15:46 03/14/2020 
-- Design Name: 
-- Module Name:    REGA - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library work;
use work.GPRMP.ALL;

entity REGA is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           REG_IN : in  BYTE;
           REG_OUT : out  BYTE;
           EN : in  STD_LOGIC);
end REGA;

architecture Behavioral of REGA is

begin

	process_REG: process(CLK, RST, EN, REG_IN)
	begin
		if (RST = '1') then
			REG_OUT <= (others => '0');
		elsif (EN = '1') then
			if (rising_edge(CLK)) then
				REG_OUT <= REG_IN;
			end if;
		end if;
	end process;

end Behavioral;

