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
use work.StackMP.ALL;

entity ROMC is
    Port ( EN : in STD_LOGIC;
           RST : in  STD_LOGIC;
			  STP: in STD_LOGIC;
			  CJ_EN: in STD_LOGIC; -- conditional jumps enabled
           L, E : in  STD_LOGIC;
           ROM_ADR : out  STD_LOGIC_VECTOR (4 downto 0);
           ROM_DATA : in  TRIBBLE;
           IR_OUT : buffer  TRIBBLE);
end ROMC;

architecture Behavioral of ROMC is

procedure IC_W_INC (
	signal jcondition: in boolean;
	signal argaddr: in STD_LOGIC_VECTOR (4 downto 0);
	signal ic: in STD_LOGIC_VECTOR (4 downto 0);
	signal result: out STD_LOGIC_VECTOR (4 downto 0)
) is
begin
	if (jcondition) then
		result <= argaddr;
	else
		result <= ic +1 ;
	end if;
end procedure IC_W_INC;

signal ir         				: TRIBBLE;
signal opcode, opcode_w     	: NIBBLE;
signal argaddr    				: STD_LOGIC_VECTOR (4 downto 0);
-- counters
signal ic_w							: STD_LOGIC_VECTOR (4 downto 0);
signal iddle_counter 			: STD_LOGIC;

signal cj							: boolean;
signal should_jump, conflict	: boolean;

begin

	ROM_ADR <= ic_w;
	ir <= ROM_DATA;
	
	opcode <= ir(11 downto 8);
	argaddr <= ir(4 downto 0);
	opcode_w <= IR_OUT(11 downto 8);
	
	cj <= opcode = JL or opcode = JE;
	should_jump <= opcode = J or (L = '1' and opcode = JL) or (E = '1' and opcode = JE);
	conflict <= (opcode_w = INC or opcode_w = DEC or opcode_w = PUSHC or opcode_w = PUSHV or opcode_w = WR
					or opcode_w = RD or opcode_w = POP) and (opcode = INC or opcode = DEC or opcode = WR or opcode = RD 
						or opcode = CMP or opcode = PEEK) and (EN = '1') and iddle_counter = '0';
	
	PIC_w: process(RST, EN, STP, ic_w, cj, ir, CJ_EN, opcode, argaddr, L, E, should_jump, conflict, iddle_counter)
	begin
		if (RST = '1') then
			ic_w <= (others => '0');
			IR_OUT <= NON & NONE;
			iddle_counter <= '0';
		elsif (falling_edge(EN)) then
			if (STP = '0') then
				if (conflict) then
					IR_OUT <= NON & NONE;
					iddle_counter <= '1';
				else
					-- check if conditional jump is fetched
					if (cj) then
						if (CJ_EN = '1') then
							IC_W_INC(should_jump, argaddr, ic_w, ic_w);
						end if;
					else
						IC_W_INC(should_jump, argaddr, ic_w, ic_w);
					end if;
					if (iddle_counter = '1') then
						iddle_counter <= '0';
					end if;
					IR_OUT <= ir;
				end if;
			end if;
		end if;
	end process;
	
end Behavioral;

