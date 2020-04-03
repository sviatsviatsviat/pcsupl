----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:43:05 03/01/2020 
-- Design Name: 
-- Module Name:    RAM_IF - Behavioral 
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
use work.StackMP.ALL;

entity RAM_IF is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           TOS : in  BYTE;
           TOS_1 : in  BYTE;
           IR : in  BYTE;
           ADR_SEL : in  STD_LOGIC;
           ADR_EN : in  STD_LOGIC;
           DATA_EN : in  STD_LOGIC;
           RAM_DATA : out  BYTE;
           RAM_ADR : out  BYTE );
end RAM_IF;

architecture Behavioral of RAM_IF is

signal din_reg : BYTE;
signal adr_reg : BYTE;
signal adr_in  : BYTE;

begin

	process_DIN_REG: process (CLK, RST, DATA_EN, TOS_1, TOS, ADR_SEL)
	begin
		if (RST = '1') then
			din_reg <= (others => '0');
		elsif (DATA_EN = '1') then
			if (rising_edge(CLK)) then
				if (ADR_SEL = '0') then
					din_reg <= TOS_1;
				else
					din_reg <= TOS;
				end if;
			end if;
		end if;
	end process;
	
	proces_ADR_IN: process (TOS, IR, ADR_SEL)
	begin
		if (ADR_SEL = '0') then
			adr_in <= TOS;
		else
			adr_in <= IR;
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
	
	RAM_DATA <= din_reg;
	RAM_ADR <= adr_reg;

end Behavioral;

