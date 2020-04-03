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
use work.GPRMP.ALL;

entity RAM_IF is
    Port ( CLK 		: in STD_LOGIC;
           RST 		: in STD_LOGIC;
           OB_RESULT : in BYTE;
			  RAM0 		: in BYTE;
			  RAM1 		: in BYTE;
			  REGA0     : in BYTE;
			  REGA1		: in BYTE;
           IR1 		: in BYTE;
			  IR2       : in BYTE;
           ADR0_SEL  : in STD_LOGIC_VECTOR(1 downto 0);
			  ADR1_SEL  : in  STD_LOGIC;
           ADR0_EN   : in  STD_LOGIC;
			  ADR1_EN   : in  STD_LOGIC;
           DATA_EN   : in  STD_LOGIC;
			  DATA_SEL  : in STD_LOGIC_VECTOR(1 downto 0);
			  RAM_DATA  : out  BYTE;
			  RAM_ADR0  : out BYTE;
           RAM_ADR1  : out  BYTE);
end RAM_IF;

architecture Behavioral of RAM_IF is

signal data_in  : BYTE;
signal din_reg  : BYTE;
signal adr0_reg  : BYTE;
signal adr0_in   : BYTE;
signal adr1_reg  : BYTE;
signal adr1_in   : BYTE;

begin

	proces_ADR0_IN: process(IR1, IR2, REGA0, REGA1, ADR0_SEL)
	begin
		if (ADR0_SEL = "00") then
			adr0_in <= IR1;
		elsif (ADR0_SEL = "01") then
			adr0_in <= IR2;
		elsif (ADR0_SEL = "10") then
			adr0_in <= REGA0;
		else
			adr0_in <= REGA1;
		end if;
	end process;
	
	process_ADR0_REG: process(CLK, RST, ADR0_EN, adr0_in)
	begin
		if (RST = '1') then
			adr0_reg <= (others => '0');
		elsif (ADR0_EN = '1') then
			if (rising_edge(CLK)) then
				adr0_reg <= adr0_in;
			end if;
		end if;
	end process;
	
	RAM_ADR0 <= adr0_reg;
	
	proces_ADR1_IN: process(REGA1, IR2, ADR1_SEL)
	begin
		if (ADR1_SEL = '1') then
			adr1_in <= IR2;
		else
			adr1_in <= REGA1;
		end if;
	end process;
	
	process_ADR1_REG: process(CLK, RST, ADR1_EN, adr1_in)
	begin
		if (RST = '1') then
			adr1_reg <= (others => '0');
		elsif (ADR1_EN = '1') then
			if (rising_edge(CLK)) then
				adr1_reg <= adr1_in;
			end if;
		end if;
	end process;
	
	RAM_ADR1 <= adr1_reg;

	process_DATA_IN: process (IR2, OB_RESULT, DATA_SEL, RAM0, RAM1)
	begin
		if (DATA_SEL = "00") then
			data_in <= IR2;
		elsif (DATA_SEL = "01") then
			data_in <= OB_RESULT;
		elsif (DATA_SEL = "10") then
			data_in <= RAM1;
		else
			data_in <= RAM0;
		end if;
	end process;

	process_DIN_REG: process (CLK, RST, DATA_EN, data_in)
	begin
		if (RST = '1') then
			din_reg <= (others => '0');
		elsif (DATA_EN = '1') then
			if (rising_edge(CLK)) then
				din_reg <= data_in;
			end if;
		end if;
	end process;
	
	RAM_DATA <= din_reg;

end Behavioral;

