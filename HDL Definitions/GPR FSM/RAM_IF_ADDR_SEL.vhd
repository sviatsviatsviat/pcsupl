----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:54:43 03/08/2020 
-- Design Name: 
-- Module Name:    RAM_IF_ADDR_SEL - Behavioral 
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

entity RAM_IF_ADDR_SEL is
Port ( 
		CLK 		: in STD_LOGIC;
      RST 		: in STD_LOGIC;
		REGA 		: in BYTE;
      IR 		: in BYTE;
      ADR_SEL  : in  STD_LOGIC;
      ADR_EN   : in  STD_LOGIC;
		RAM_ADR  : out BYTE
		);
end RAM_IF_ADDR_SEL;

architecture Behavioral of RAM_IF_ADDR_SEL is

signal adr_reg  : BYTE;
signal adr_in   : BYTE;

begin

	proces_ADR_IN: process(REGA, IR, ADR_SEL)
	begin
		if (ADR_SEL = '1') then
			adr_in <= IR;
		else
			adr_in <= REGA;
		end if;
	end process;
	
	process_ADR_REG: process(CLK, RST, ADR_EN, adr_in)
	begin
		if (RST = '1') then
			adr_reg <= (others => '0');
		elsif (ADR_EN = '1') then
			if (rising_edge(CLK)) then
				adr_reg <= adr_in;
			end if;
		end if;
	end process;
	
	RAM_ADR <= adr_reg;

end Behavioral;

