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
use work.GPRMP.ALL;

entity OB_UNIT is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           RAM0 : in  BYTE;
           RAM1 : in  BYTE;
			  IR2  : in BYTE;
           OPCODE : in  NIBBLE;
           RESULT : out  BYTE;
           L_FLAG : out  STD_LOGIC;
           E_FLAG : out  STD_LOGIC);
end OB_UNIT;

architecture Behavioral of OB_UNIT is

signal reg_res	 : BYTE;
signal dec_res	 : BYTE;
signal inc_res	 : BYTE;
signal l_res	 : STD_LOGIC;
signal e_res	 : STD_LOGIC;
signal l, e 	 : STD_LOGIC;

signal op1, op2 : BYTE;

begin

	op1 <= RAM0;
	
	process_OP2 : process(OPCODE, RAM1, IR2)
	begin
		if (OPCODE = TESTC) then
			op2 <= IR2;
		else
			op2 <= RAM1;
		end if;
	end process;

	process_CMP : process (op1, op2)
	begin
			if (op2 < op1) then
				l <= '1';
				e <= '0';
			elsif (op2 = op1) then
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
				if (OPCODE = TESTC or OPCODE = TEST) then
					l_res <= l;
					e_res <= e;
				end if;
			end if;
		end if;
	end process;
	
	L_FLAG <= l_res;
	E_FLAG <= e_res;
	
	inc_res <= op1 + 1;
	dec_res <= op1 - 1;
	
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

end Behavioral;

