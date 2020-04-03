----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:58:43 03/01/2020 
-- Design Name: 
-- Module Name:    LIFO - Behavioral 
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

entity LIFO is
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
end LIFO;

architecture Behavioral of LIFO is

type t_reg is array (0 to Size - 1) of BYTE;
type t_state is (L_EMPTY, L_NORMAL, L_FULL);

type t_flags is record
	empty : std_logic;
	full	: std_logic;
end record;

type t_lifo is record
	tos	: BYTE;
	tos_1 : BYTE;
	regs	: t_reg;
	state : t_state;
	flags : t_flags;
end record;

signal s_lifo : t_lifo;

begin

	process_LIFO: process(CLK, RST, LIFO_EN, MODE, DATA_IN, s_lifo)
	variable pointer : integer range 0 to Size-1;
	begin
		if (RST = '1') then
			for i in 0 to Size-1 loop
				s_lifo.regs(i) <= (others => '0');
			end loop;
			s_lifo.state			<= L_EMPTY;
			s_lifo.flags.empty 	<= '1';
			s_lifo.flags.full		<= '0';
			pointer := 0;
		elsif (LIFO_EN = '1') then
			if (rising_edge(CLK)) then
				case s_lifo.state is
					when L_EMPTY => 
						if (MODE = "00" or MODE = "11") then
							s_lifo.regs(pointer) <= DATA_IN;
							s_lifo.flags.empty <= '0';
							s_lifo.state <= L_NORMAL;
						end if;
					when L_NORMAL => 
						if (MODE = "00") then
							pointer := pointer + 1;
							s_lifo.regs(pointer) <= DATA_IN;
							if (pointer = Size - 1) then
								s_lifo.flags.full <= '1';
								s_lifo.state 		<= L_FULL;
							end if;
						elsif (MODE = "01") then
							s_lifo.regs(pointer) <= (others => '0');
							if (pointer = 0) then
								s_lifo.flags.empty <= '1';
								s_lifo.state		 <= L_EMPTY;
							else
								pointer := pointer - 1;
							end if;
						elsif (MODE = "10") then
							s_lifo.regs(pointer) <= (others => '0');
							if (pointer = 0) then
								s_lifo.flags.empty <= '1';
								s_lifo.state 		 <= L_EMPTY;
							elsif (pointer = 1) then
								pointer := pointer - 1;
								s_lifo.regs(pointer) <= (others => '0');
								s_lifo.flags.empty <= '1';
								s_lifo.state		 <= L_EMPTY;
							else
								pointer := pointer - 1;
								s_lifo.regs(pointer) <= (others => '0');
								pointer := pointer - 1;
							end if;
						elsif (MODE = "11") then
							s_lifo.regs(pointer) <= DATA_IN;
						end if;
					when L_FULL => 
						if (MODE = "01") then
							s_lifo.regs(pointer) <= (others => '0');
							s_lifo.flags.full		<= '0';
							s_lifo.state			<=  L_NORMAL;
							pointer := pointer - 1;
						elsif (MODE = "10") then
							s_lifo.regs(pointer) <= (others => '0');
							pointer := pointer - 1;
							s_lifo.regs(pointer) <= (others => '0');
							pointer := pointer - 1;
							s_lifo.flags.full		<= '0';
							s_lifo.state			<=  L_NORMAL;
						elsif (MODE = "11") then
							s_lifo.regs(pointer) <= DATA_IN;
						end if;
					when others => 
						s_lifo.flags.empty <= '1';
						s_lifo.flags.full	 <= '1';
				end case;
			end if;
		end if;
		
		s_lifo.tos <= s_lifo.regs(pointer);
		if(pointer > 0) then
			s_lifo.tos_1 <= s_lifo.regs(pointer-1);
		else
			s_lifo.tos_1 <= (others => '0');
		end if;
	end process;
	
	
	
	TOS 	<= s_lifo.tos;
	TOS_1 <= s_lifo.tos_1;

	EMPTY <= s_lifo.flags.empty;
	FULL	<= s_lifo.flags.full;

end Behavioral;

