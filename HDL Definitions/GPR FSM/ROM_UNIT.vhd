----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:41:10 03/01/2020 
-- Design Name: 
-- Module Name:    ROM_UNIT - Behavioral 
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

entity ROM_UNIT is
    Port ( CLK 	: in  STD_LOGIC;
           RST 	: in  STD_LOGIC;
           PC_EN 	: in  STD_LOGIC;
           IR_EN 	: in  STD_LOGIC;
			  ROM_EN : in  STD_LOGIC;
           L 		: in  STD_LOGIC;
           E 		: in  STD_LOGIC;
           IR_OUT : out  PENTIBBLE
			  );
end ROM_UNIT;

architecture Structural of ROM_UNIT is

component ROM is
    Port ( ADR 	: in  STD_LOGIC_VECTOR (4 downto 0);
           CLK 	: in  STD_LOGIC;
           EN 		: in  STD_LOGIC;
           RST 	: in  STD_LOGIC;
           DOUT 	: out PENTIBBLE );
end component;

component ROM_IF is
    Port ( CLK 		: in  STD_LOGIC;
           RST 		: in  STD_LOGIC;
           PC_EN 		: in  STD_LOGIC;
           IR_EN 		: in  STD_LOGIC;
           L, E 		: in  STD_LOGIC;
           ROM_ADR 	: out  STD_LOGIC_VECTOR (4 downto 0);
           ROM_DATA 	: in  PENTIBBLE;
           IR_OUT 	: out  PENTIBBLE);
end component;

signal rom_adr		: STD_LOGIC_VECTOR (4 downto 0);
signal rom_data	: PENTIBBLE;

begin

U_ROM:	 ROM	   port map (rom_adr, CLK, ROM_EN, RST, rom_data);
U_ROM_IF: ROM_IF  port map (CLK, RST, PC_EN, IR_EN, L, E, rom_adr, rom_data, IR_OUT);

end Structural;

