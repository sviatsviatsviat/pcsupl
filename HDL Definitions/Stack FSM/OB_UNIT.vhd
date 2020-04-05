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
use work.StackMP.ALL;

entity OB_UNIT is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           ARG_1 : in  BYTE;
           ARG_2 : in  BYTE;
           OPCODE : in  NIBBLE;
           RESULT : out  BYTE;
           L_FLAG : out  STD_LOGIC;
           E_FLAG : out  STD_LOGIC);
end OB_UNIT;

architecture Behavioral of OB_UNIT is

signal reg_res	 : BYTE;
signal dec_res	 : BYTE;
signal inc_res	 : BYTE;
signal l			 : STD_LOGIC;
signal l_res	 : STD_LOGIC;
signal e			 : STD_LOGIC;
signal e_res	 : STD_LOGIC;

begin

	process_CMP : process (ARG_1, ARG_2)
	begin
		if (ARG_1 > ARG_2) then
			l <= '1';
			e <= '0';
		elsif (ARG_1 = ARG_2) then
			l <= '0';
			e <= '1';
		else
			l <= '0';
			e <= '0';
		end if;
	end process;
	
	inc_res <= ARG_1 + 1;
	dec_res <= ARG_1 - 1;
	
	process_REG_RES : process (CLK, RST, EN, OPCODE, dec_res, inc_res)
	begin
		if (RST = '1') then
			reg_res <= (others => '0');
		elsif (EN = '1') then
			if (rising_edge(CLK)) then
				if (OPCODE = INC) then
					reg_res <= inc_res;
				elsif (OPCODE = DEC) then
					reg_res <= dec_res;
				end if;
			end if;
		end if;
	end process;
	
	RESULT <= reg_res;
	
	process_L_RES: process (CLK, RST, EN, OPCODE, l)
	begin
		if (RST = '1') then
			l_res <= '0';
		elsif (EN = '1') then
			if (rising_edge(CLK)) then
				if (OPCODE = CMP or OPCODE = JL) then
					l_res <= l;
				else
					l_res <= '0';
				end if;
			end if;
		end if;
	end process;
	
	L_FLAG <= l_res;
	
	process_E_RES: process (CLK, RST, EN, OPCODE, e)
	begin
		if (RST = '1') then
			e_res <= '0';
		elsif (EN = '1') then
			if (rising_edge(CLK)) then
				if (OPCODE = CMP or OPCODE = JE) then
					e_res <= e;
				else
					e_res <= '0';
				end if;
			end if;
		end if;
	end process;
	
	E_FLAG <= e_res;

end Behavioral;

