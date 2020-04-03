----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:55:20 03/01/2020 
-- Design Name: 
-- Module Name:    ROM_IF - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.GPRMP.ALL;

entity ROM_IF is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           PC_EN : in  STD_LOGIC;
           IR_EN : in  STD_LOGIC;
           L, E : in  STD_LOGIC;
           ROM_ADR : out  STD_LOGIC_VECTOR (4 downto 0);
           ROM_DATA : in  PENTIBBLE;
           IR_OUT : out  PENTIBBLE);
end ROM_IF;

architecture Behavioral of ROM_IF is

signal pc_current : STD_LOGIC_VECTOR (4 downto 0);
signal pc_next    : STD_LOGIC_VECTOR (4 downto 0);
signal ir         : PENTIBBLE;
signal opcode     : NIBBLE;
signal argaddr    : STD_LOGIC_VECTOR (4 downto 0);

begin

	-- Read Current Instruction
	process_IR: process(CLK, RST, IR_EN, ROM_DATA)
	begin
		if (RST = '1') then
			ir <= NON & NONE & NONE;
		elsif (IR_EN = '1') then
			if (rising_edge(CLK)) then
				ir <= ROM_DATA;
			end if;
		end if;
	end process;
	
	opcode <= ir(19 downto 16);	
	argaddr <= ir(12 downto 8);
	
	-- Promote counter
	process_PC_REG: process(CLK, RST, PC_EN, pc_next)
	begin
		if (RST = '1') then
			pc_current <= ( others => '0');
		elsif (PC_EN = '1') then
			if (rising_edge(CLK)) then
				pc_current <= pc_next;
			end if;
		end if;
	end process;
	
	-- Select next value of the counter
	process_PC_NEXT: process(L, E, pc_current, opcode, argaddr)
	begin
		if (opcode = J or (opcode = JLE and (L = '1' or E = '1')) or (opcode = JL and L = '1')) then
			pc_next <= argaddr;
		else
			pc_next <= pc_current + 1; 
		end if;
	end process;
	
	IR_OUT <= ir;
	ROM_ADR <= pc_current;

end Behavioral;

