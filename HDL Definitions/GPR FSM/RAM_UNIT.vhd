----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:12:24 03/01/2020 
-- Design Name: 
-- Module Name:    RAM_UNIT - Structural 
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

entity RAM_UNIT is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           R0_EN : std_logic;
			  R1_EN : std_logic;
			  W0_EN : std_logic;
			  OB_RESULT : in BYTE;
			  REGA0     : in BYTE;
			  REGA1		: in BYTE;
           IR1 		: in BYTE;
			  IR2       : in BYTE;
           ADR0_SEL  : in  STD_LOGIC_VECTOR(1 downto 0);
			  ADR1_SEL  : in  STD_LOGIC;
           ADR0_EN   : in  STD_LOGIC;
			  ADR1_EN   : in  STD_LOGIC;
           DATA_EN   : in  STD_LOGIC;
			  DATA_SEL  : in STD_LOGIC_VECTOR(1 downto 0);
			  DOUT0 : out  BYTE;
           DOUT1 : out  BYTE
			  );
end RAM_UNIT;

architecture Structural of RAM_UNIT is

component RAM is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
			  R0_EN : in std_logic;
			  R1_EN : in std_logic;
			  W0_EN : in std_logic;
           ADR0 : in  BYTE;
			  ADR1 : in BYTE;
			  DIN0 : in BYTE;
           DOUT0 : out  BYTE;
           DOUT1 : out  BYTE );
end component;

component RAM_IF is
    Port ( CLK 		: in STD_LOGIC;
           RST 		: in STD_LOGIC;
           OB_RESULT : in BYTE;
			  RAM0 		: in BYTE;
			  RAM1 		: in BYTE;
			  REGA0     : in BYTE;
			  REGA1		: in BYTE;
           IR1 		: in BYTE;
			  IR2       : in BYTE;
           ADR0_SEL  : in  STD_LOGIC_VECTOR(1 downto 0);
			  ADR1_SEL  : in  STD_LOGIC;
           ADR0_EN   : in  STD_LOGIC;
			  ADR1_EN   : in  STD_LOGIC;
           DATA_EN   : in  STD_LOGIC;
			  DATA_SEL  : in STD_LOGIC_VECTOR(1 downto 0);
			  RAM_DATA  : out  BYTE;
			  RAM_ADR0  : out BYTE;
           RAM_ADR1  : out  BYTE);
end component;

signal ram_adr_0 	  		: BYTE;
signal ram_adr_1 	  		: BYTE;
signal ram_data_in  		: BYTE;
signal ram_data_out_0   : BYTE;
signal ram_data_out_1 	: BYTE;

begin

U_RAM:	 RAM	  port map (CLK, RST, R0_EN, R1_EN, W0_EN, ram_adr_0, ram_adr_1, ram_data_in, ram_data_out_0, ram_data_out_1);
U_RAM_IF: RAM_IF port map (CLK, RST, OB_RESULT, ram_data_out_0, ram_data_out_1, REGA0, REGA1, IR1, IR2, ADR0_SEL, ADR1_SEL, ADR0_EN, ADR1_EN, DATA_EN, DATA_SEL, ram_data_in, ram_adr_0, ram_adr_1);

DOUT0 <= ram_data_out_0;
DOUT1 <= ram_data_out_1;

end Structural;

