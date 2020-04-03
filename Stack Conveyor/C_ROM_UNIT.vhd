----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:55:47 03/18/2020 
-- Design Name: 
-- Module Name:    C_ROM_UNIT - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity C_ROM_UNIT is
    Port ( EN 	: in  STD_LOGIC;
           RST 	: in  STD_LOGIC;
			  ROM_EN : in  STD_LOGIC;
			  STP: in STD_LOGIC;
			  CJ_EN: in STD_LOGIC; -- conditional jumps enabled
           L 		: in  STD_LOGIC;
           E 		: in  STD_LOGIC;
           IR_OUT : buffer  TRIBBLE
			  );
end C_ROM_UNIT;

architecture Behavioral of C_ROM_UNIT is

component ROMC is
    Port ( EN : in STD_LOGIC;
           RST : in  STD_LOGIC;
			  STP: in STD_LOGIC;
			  CJ_EN: in STD_LOGIC; -- conditional jumps enabled
           L, E : in  STD_LOGIC;
           ROM_ADR : out  STD_LOGIC_VECTOR (4 downto 0);
           ROM_DATA : in  TRIBBLE;
           IR_OUT : buffer  TRIBBLE);
end component;

component ROM is
    Port ( ADR 	: in  STD_LOGIC_VECTOR (4 downto 0);
           CLK 	: in  STD_LOGIC;
           EN 		: in  STD_LOGIC;
           RST 	: in  STD_LOGIC;
           DOUT 	: out TRIBBLE );
end component;

signal rom_adr		: STD_LOGIC_VECTOR (4 downto 0);
signal rom_data	: TRIBBLE;

begin

U_ROM:	 	ROM	port map (rom_adr, EN, ROM_EN, RST, rom_data);
U_ROM_CTRL: ROMC  port map (EN, RST, STP, CJ_EN, L, E, rom_adr, rom_data, IR_OUT);

end Behavioral;

