----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:51:21 03/02/2020 
-- Design Name: 
-- Module Name:    FSM_Unit - Structural 
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

entity FSM_Unit is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           START : in  STD_LOGIC;
           HALT : out  STD_LOGIC;
           ERROR : out  STD_LOGIC);
end FSM_Unit;

architecture Structural of FSM_Unit is

component FSM is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           START : in  STD_LOGIC;
           HALT : out  STD_LOGIC;
           ERROR : out  STD_LOGIC;
           FSM_ROM_OUT : out  ROM_UNIT_INPUTS;
           FSM_ROM_IN : in  ROM_UNIT_OUTPUTS;
           FSM_RAM_OUT : out  RAM_UNIT_INPUTS;
           FSM_RAM_IN : in  RAM_UNIT_OUTPUTS;
           FSM_LIFO_OUT : out  LIFO_UNIT_INPUTS;
           FSM_LIFO_IN : in  LIFO_UNIT_OUTPUTS;
           FSM_OB_OUT : out  OB_UNIT_INPUTS;
           FSM_OB_IN : in  OB_UNIT_OUTPUTS);
end component;

component ROM_UNIT_X is
    Port ( ROM_IN : in  ROM_UNIT_INPUTS;
           ROM_OUT : out  ROM_UNIT_OUTPUTS );
end component;

component RAM_UNIT_X is
    Port ( RAM_IN : in  RAM_UNIT_INPUTS;
           RAM_OUT : out  RAM_UNIT_OUTPUTS);
end component;

component LIFO_UNIT_X is
    Port ( LIFO_IN : in  LIFO_UNIT_INPUTS;
           LIFO_OUT : out  LIFO_UNIT_OUTPUTS);
end component;

component OB_UNIT_X is
    Port ( OB_IN : in  OB_UNIT_INPUTS;
           OB_OUT : out  OB_UNIT_OUTPUTS);
end component;

signal bus_rom : ROM_UNIT_INPUTS;
signal rom_data : ROM_UNIT_OUTPUTS;

signal bus_ram : RAM_UNIT_INPUTS;
signal ram_data : RAM_UNIT_OUTPUTS;

signal bus_lifo : LIFO_UNIT_INPUTS;
signal lifo_data : LIFO_UNIT_OUTPUTS;

signal bus_ob : OB_UNIT_INPUTS;
signal ob_data : OB_UNIT_OUTPUTS; 

begin

	U_FSM: FSM port map (CLK, RST, START, HALT, ERROR, BUS_ROM, ROM_DATA, BUS_RAM, RAM_DATA,
		BUS_LIFO, LIFO_DATA, BUS_OB, OB_DATA);
		
	U_ROM_UNIT: ROM_UNIT_X port map (BUS_ROM, ROM_DATA);
	
	U_RAM_UNIT: RAM_UNIT_X port map (BUS_RAM, RAM_DATA);
	
	U_LIFO_UNIT: LIFO_UNIT_X port map (BUS_LIFO, LIFO_DATA);
	
	U_OB_UNIT: OB_UNIT_X port map (BUS_OB, OB_DATA);

end Structural;

