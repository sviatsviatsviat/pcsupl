----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:57:57 03/01/2020 
-- Design Name: 
-- Module Name:    OB_UNIT - Behavioral 
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
use work.AccumMP.ALL;

entity OB_UNIT is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           ACC : in  BYTE;
           RAM : in  BYTE;
           OPCODE : in  NIBBLE;
           L_FLAG : out  STD_LOGIC;
           E_FLAG : out  STD_LOGIC);
end OB_UNIT;

architecture Behavioral of OB_UNIT is

signal l			 : STD_LOGIC;
signal l_res	 : STD_LOGIC;
signal e			 : STD_LOGIC;
signal e_res	 : STD_LOGIC;

begin

	process_CMP : process (ACC, RAM)
	begin
		if (ACC < RAM) then
			l <= '1';
			e <= '0';
		elsif (ACC = RAM) then
			l <= '0';
			e <= '1';
		else
			l <= '0';
			e <= '0';
		end if;
	end process;
	
	process_LE_RES: process (CLK, RST, EN, OPCODE, l, e)
	begin
		if (RST = '1') then
			l_res <= '0';
			e_res <= '0';
		elsif (EN = '1') then
			if (rising_edge(CLK)) then
				if (OPCODE = CMP or OPCODE = JLE) then
					l_res <= l;
					e_res <= e;
				elsif (OPCODE = JL) then
					l_res <= l;
					e_res <= '0';
				else
					l_res <= '0';
					e_res <= '0';
				end if;
			end if;
		end if;
	end process;
	
	L_FLAG <= l_res;
	E_FLAG <= e_res;

end Behavioral;

