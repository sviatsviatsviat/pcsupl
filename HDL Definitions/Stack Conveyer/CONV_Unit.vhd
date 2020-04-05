----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:23:29 03/23/2020 
-- Design Name: 
-- Module Name:    CONV_Unit - Behavioral 
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

entity CONV_Unit is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           START : in  STD_LOGIC;
           HALT : out  STD_LOGIC;
           ERROR : out  STD_LOGIC);
end CONV_Unit;

architecture Structural of CONV_Unit is

component CONV is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           START : in  STD_LOGIC;
           HALT : out  STD_LOGIC;
           ERROR : out  STD_LOGIC;
           ROM_OUT : out  C_ROM_UNIT_INPUTS;
           ROM_IN : in ROM_UNIT_OUTPUTS;
           RAM_OUT : out  C_RAM_UNIT_INPUTS;
           RAM_IN : in  RAM_UNIT_OUTPUTS;
           LIFO_OUT : out  C_LIFO_UNIT_INPUTS;
           LIFO_IN : in  LIFO_UNIT_OUTPUTS;
           OB_OUT : out  OB_UNIT_INPUTS;
           OB_IN : in  OB_UNIT_OUTPUTS);
end component;

component C_ROM_UNIT is
    Port ( EN 	: in  STD_LOGIC;
           RST 	: in  STD_LOGIC;
			  ROM_EN : in  STD_LOGIC;
			  STP: in STD_LOGIC;
			  CJ_EN: in STD_LOGIC; -- conditional jumps enabled
           L 		: in  STD_LOGIC;
           E 		: in  STD_LOGIC;
           IR_OUT : buffer  TRIBBLE
			  );
end component C_ROM_UNIT;


component RAM is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           W_EN : in  STD_LOGIC;
           R_EN : in  STD_LOGIC;
           ADR : in  BYTE;
           DIN : in  BYTE;
           DOUT : out  BYTE );
end component;

component LIFO is
	 Generic (Size : integer := 6);
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           LIFO_EN : in  STD_LOGIC;
           MODE : in  STD_LOGIC_VECTOR (1 downto 0);
           DATA_IN : in  BYTE;
           TOS : out  BYTE;
           TOS_1 : out  BYTE;
           EMPTY : out  STD_LOGIC;
           FULL : out  STD_LOGIC);
end component;

component OB_UNIT_X is
    Port ( OB_IN : in  OB_UNIT_INPUTS;
           OB_OUT : out  OB_UNIT_OUTPUTS);
end component;

signal bus_rom : C_ROM_UNIT_INPUTS;
signal rom_data : ROM_UNIT_OUTPUTS;

signal bus_ram : C_RAM_UNIT_INPUTS;
signal ram_data : RAM_UNIT_OUTPUTS;

signal bus_lifo : C_LIFO_UNIT_INPUTS;
signal lifo_data : LIFO_UNIT_OUTPUTS;

signal bus_ob : OB_UNIT_INPUTS;
signal ob_data : OB_UNIT_OUTPUTS; 

begin

	U_CONV: CONV port map (CLK, RST, START, HALT, ERROR, BUS_ROM, ROM_DATA, BUS_RAM, RAM_DATA,
		BUS_LIFO, LIFO_DATA, BUS_OB, OB_DATA);
		
	U_ROM_UNIT: C_ROM_UNIT port map (BUS_ROM.EN, BUS_ROM.RST, BUS_ROM.ROM_EN, BUS_ROM.STP, BUS_ROM.CJ_EN, BUS_ROM.L, BUS_ROM.E, ROM_DATA.IR);
	
	U_RAM_UNIT: RAM port map (BUS_RAM.CLK, BUS_RAM.RST, BUS_RAM.W_EN, BUS_RAM.R_EN, BUS_RAM.ADR, BUS_RAM.DIN, RAM_DATA.RAM_DATA);
	
	U_LIFO_UNIT: LIFO generic map(6) port map (BUS_LIFO.CLK, BUS_LIFO.RST, BUS_LIFO.LIFO_EN, BUS_LIFO.MODE, BUS_LIFO.PUSHDATA, LIFO_DATA.TOS, LIFO_DATA.TOS_1, LIFO_DATA.EMPTY, LIFO_DATA.FULL);
	
	U_OB_UNIT: OB_UNIT_X port map (BUS_OB, OB_DATA);

end Structural;

