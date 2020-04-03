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
use work.StackMP.ALL;

entity RAM_UNIT is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           TOS : in  BYTE;
           TOS_1 : in  BYTE;
           IR : in  BYTE;
           ADR_SEL : in  STD_LOGIC;
           ADR_EN : in  STD_LOGIC;
           DATA_EN : in  STD_LOGIC;
           W_EN : in  STD_LOGIC;
           R_EN : in  STD_LOGIC;
           RAM_DATA : out  BYTE);
end RAM_UNIT;

architecture Structural of RAM_UNIT is

component RAM is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           W_EN : in  STD_LOGIC;
           R_EN : in  STD_LOGIC;
           ADR : in  BYTE;
           DIN : in  BYTE;
           DOUT : out  BYTE );
end component;

component RAM_IF is
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
end component;

signal ram_adr 	  : BYTE;
signal ram_data_in  : BYTE;
signal ram_data_out : BYTE;

begin

U_RAM:	 RAM	  port map (CLK, RST, W_EN, R_EN, ram_adr, ram_data_in, ram_data_out);
U_RAM_IF: RAM_IF port map (CLK, RST, TOS, TOS_1, IR, ADR_SEL, ADR_EN, DATA_EN, ram_data_in, ram_adr);

RAM_DATA <= ram_data_out;

end Structural;

