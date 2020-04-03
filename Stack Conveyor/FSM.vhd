----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:05:39 03/02/2020 
-- Design Name: 
-- Module Name:    FSM - Behavioral 
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

entity FSM is
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
end FSM;

architecture Behavioral of FSM is

type t_states is (
	s_IDLE,
	s_READ_ROM,
	s_WRITE_IR,
	s_DECODE,
	s_PUSHC,
	s_PUSHV,
	s_PEEK, 
	s_POP,  
	s_WR,   
	s_RD,   
	s_CMP,  
	s_J, 
	s_JL, 
	s_JE,  
	s_INC,  
	s_DEC,  
	s_OB_INC,
	s_OB_DEC,
	s_OB_CMP,
	s_RAM_RD,
	s_RAM_WR,
	s_LIFO_PUSH,
	s_LIFO_TOSRW,
	s_LIFO_POP1,
	s_LIFO_POP2,
	s_PC_NEW,
	s_HALT,
	s_ERROR
);

type t_fsm_state is record
	cur, nxt: t_states;
end record;

signal state: t_fsm_state;
signal opcode: NIBBLE;

begin

	opcode <= FSM_ROM_IN.IR(11 downto 8);

	process_FSM_MEM: process(CLK, RST, state.nxt)
	begin
		if (RST = '1') then
			state.cur <= s_IDLE;
		elsif (rising_edge(CLK)) then
			state.cur <= state.nxt;
		end if;
	end process;
	
	process_FSM_NEXT: process(state.cur, START, opcode, FSM_LIFO_IN.EMPTY, FSM_LIFO_IN.FULL)
	begin
		case state.cur is
			when s_IDLE => 
				if (START = '1') then
					state.nxt <= s_READ_ROM;
				else
					state.nxt <= s_IDLE;
				end if;
			when s_READ_ROM => state.nxt <= s_WRITE_IR;
			when s_WRITE_IR => state.nxt <= s_DECODE;
			when s_DECODE => 
				case opcode is
					when STOP => state.nxt <= s_HALT;
					when PUSHV => state.nxt <= s_PUSHV;
					when RD => state.nxt <= s_RD;
					when PUSHC => state.nxt <= s_PUSHC;
					when PEEK => state.nxt <= s_PEEK;
					when WR => state.nxt <= s_WR;
					when POP => state.nxt <= s_POP;
					when CMP => state.nxt <= s_CMP;
					when INC => state.nxt <= s_INC;
					when DEC => state.nxt <= s_DEC;
					when J => state.nxt <= s_J;
					when JL => state.nxt <= s_JL;
					when JE => state.nxt <= s_JE;
					when others => state.nxt <= s_ERROR;
				end case;
			when s_PUSHC => state.nxt <= s_LIFO_PUSH;
			when s_PUSHV => state.nxt <= s_RAM_RD;
			when s_RD => state.nxt <= s_RAM_RD;
			when s_PEEK => state.nxt <= s_RAM_WR;
			when s_WR => state.nxt <= s_RAM_WR;
			when s_POP => state.nxt <= s_LIFO_POP1;
			when s_CMP => state.nxt <= s_OB_CMP;
			when s_INC => state.nxt <= s_OB_INC;
			when s_DEC => state.nxt <= s_OB_DEC;
			when s_J => state.nxt <= s_PC_NEW;
			when s_JL => state.nxt <= s_PC_NEW;
			when s_JE => state.nxt <= s_PC_NEW;
			when s_RAM_RD => 
				if (opcode = PUSHV) then
					state.nxt <= s_LIFO_PUSH;
				elsif (opcode = RD) then
					state.nxt <= s_LIFO_TOSRW;
				else
					state.nxt <= s_ERROR;
				end if;
			when s_LIFO_PUSH => state.nxt <= s_PC_NEW;
			when s_LIFO_TOSRW => state.nxt <= s_PC_NEW;
			when s_OB_INC => state.nxt <= s_LIFO_TOSRW;
			when s_OB_DEC => state.nxt <= s_LIFO_TOSRW;
			when s_RAM_WR =>
				if (opcode = PEEK) then
					state.nxt <= s_PC_NEW;
				elsif (opcode = WR) then
					state.nxt <= s_LIFO_POP2;
				else
					state.nxt <= s_ERROR;
				end if;
			when s_OB_CMP => state.nxt <= s_PC_NEW;
			when s_LIFO_POP1 => state.nxt <= s_PC_NEW;
			when s_LIFO_POP2 => state.nxt <= s_PC_NEW;
			when s_HALT => state.nxt <= s_HALT;
			when s_PC_NEW => 
				if (FSM_LIFO_IN.EMPTY = '1' and FSM_LIFO_IN.FULL = '1') then
					state.nxt <= s_ERROR;
				else
					state.nxt <= s_READ_ROM;
				end if;
			when others => state.nxt <= s_ERROR;
		end case;
	end process;
	
	process_OUT_ERROR: process(state.cur)
	begin
		if (state.cur = s_ERROR) then
			ERROR <= '1';
		else
			ERROR <= '0';
		end if;
	end process;
	
	process_OUT_STOP: process(state.cur)
	begin
		if (state.cur = s_HALT) then
			HALT <= '1';
		else
			HALT <= '0';
		end if;
	end process;
	
	FSM_ROM_OUT.CLK <= CLK;
	FSM_ROM_OUT.RST <= RST;
	FSM_ROM_OUT.L	 <= FSM_OB_IN.L_FLAG;
	FSM_ROM_OUT.E	 <= FSM_OB_IN.E_FLAG;
	
	process_OUT_ROM_IF: process(state.cur)
	begin
		case state.cur is
			when s_READ_ROM => 
				FSM_ROM_OUT.EN <= '1';
				FSM_ROM_OUT.IR_EN <= '0';
				FSM_ROM_OUT.PC_EN <= '0';
			when s_WRITE_IR =>
				FSM_ROM_OUT.EN <= '0';
				FSM_ROM_OUT.IR_EN <= '1';
				FSM_ROM_OUT.PC_EN <= '0';
			when s_PC_NEW => 
				FSM_ROM_OUT.EN <= '0';
				FSM_ROM_OUT.IR_EN <= '0';
				FSM_ROM_OUT.PC_EN <= '1';
			when others =>
				FSM_ROM_OUT.EN <= '0';
				FSM_ROM_OUT.IR_EN <= '0';
				FSM_ROM_OUT.PC_EN <= '0';
		end case;
	end process;

	FSM_RAM_OUT.CLK <= CLK;
	FSM_RAM_OUT.RST <= RST;
	FSM_RAM_OUT.TOS <= FSM_LIFO_IN.TOS;
	FSM_RAM_OUT.TOS_1 <= FSM_LIFO_IN.TOS_1;
	FSM_RAM_OUT.IR <= FSM_ROM_IN.IR(7 downto 0);

	process_OUT_RAM_IF_1: process(state.cur)
	begin
		case state.cur is 
			when s_RAM_RD =>
				FSM_RAM_OUT.R_EN <= '1';
				FSM_RAM_OUT.W_EN <= '0';
			when s_RAM_WR =>
				FSM_RAM_OUT.R_EN <= '0';
				FSM_RAM_OUT.W_EN <= '1';
			when others =>
				FSM_RAM_OUT.R_EN <= '0';
				FSM_RAM_OUT.W_EN <= '0';
		end case;
	end process;
	
	process_OUT_RAM_IF_2: process(state.cur)
	begin
		case state.cur is
			when s_PUSHV =>
				FSM_RAM_OUT.ADR_SEL <= '1';
				FSM_RAM_OUT.ADR_EN <= '1';
				FSM_RAM_OUT.DATA_EN <= '0';
			when s_WR => 
				FSM_RAM_OUT.ADR_SEL <= '0';
				FSM_RAM_OUT.ADR_EN <= '1';
				FSM_RAM_OUT.DATA_EN <= '1';
			when s_PEEK =>
				FSM_RAM_OUT.ADR_SEL <= '1';
				FSM_RAM_OUT.ADR_EN <= '1';
				FSM_RAM_OUT.DATA_EN <= '1';
			when s_RD =>
				FSM_RAM_OUT.ADR_SEL <= '0';
				FSM_RAM_OUT.ADR_EN <= '1';
				FSM_RAM_OUT.DATA_EN <= '0';
			when others =>
				FSM_RAM_OUT.ADR_SEL <= '0';
				FSM_RAM_OUT.ADR_EN <= '0';
				FSM_RAM_OUT.DATA_EN <= '0';
		end case;
	end process;
	
	FSM_LIFO_OUT.CLK <= CLK;
	FSM_LIFO_OUT.RST <= RST;
	FSM_LIFO_OUT.OB_RESULT <= FSM_OB_IN.RESULT;
	FSM_LIFO_OUT.RAM_DATA <= FSM_RAM_IN.RAM_DATA;
	FSM_LIFO_OUT.IR_OUT <= FSM_ROM_IN.IR(7 downto 0);
	
	process_OUT_LIFO_IF_1: process(state.cur)
	begin
		case state.cur is
			when s_LIFO_PUSH => FSM_LIFO_OUT.LIFO_EN <= '1';
			when s_LIFO_TOSRW => FSM_LIFO_OUT.LIFO_EN <= '1';
			when s_LIFO_POP1 => FSM_LIFO_OUT.LIFO_EN <= '1';
			when s_LIFO_POP2 => FSM_LIFO_OUT.LIFO_EN <= '1';
			when others => FSM_LIFO_OUT.LIFO_EN <= '0';
		end case;
	end process;
	
	process_OUT_LIFO_IF_2: process(state.cur, opcode)
	begin
		case opcode is
			when PUSHV => FSM_LIFO_OUT.MODE <= "00";
			when PUSHC => FSM_LIFO_OUT.MODE <= "00";
			when RD => FSM_LIFO_OUT.MODE <= "11";
			when INC => FSM_LIFO_OUT.MODE <= "11";
			when DEC => FSM_LIFO_OUT.MODE <= "11";
			when WR => FSM_LIFO_OUT.MODE <= "10";
			when POP => FSM_LIFO_OUT.MODE <= "01";
			when others => FSM_LIFO_OUT.MODE <= "00";
		end case;
	end process;
	
	process_OUT_LIFO_IF_3: process(state.cur, opcode)
	begin
		case opcode is
			when PUSHV | RD => FSM_LIFO_OUT.PUSHDATA <= "01";
			when PUSHC => FSM_LIFO_OUT.PUSHDATA <= "10";
			when INC | DEC => FSM_LIFO_OUT.PUSHDATA <= "00";
			when others => FSM_LIFO_OUT.PUSHDATA <= "00";
		end case;
	end process;
	
	FSM_OB_OUT.CLK <= CLK;
	FSM_OB_OUT.RST <= RST;
	FSM_OB_OUT.ARG_1 <= FSM_LIFO_IN.TOS;
	FSM_OB_OUT.ARG_2 <= FSM_LIFO_IN.TOS_1;
	FSM_OB_OUT.OPCODE <= opcode;
	
	process_OUT_OB_IF: process(state.cur)
	begin
		case state.cur is
			when s_OB_INC => FSM_OB_OUT.EN <= '1';
			when s_OB_DEC => FSM_OB_OUT.EN <= '1';
			when s_OB_CMP => FSM_OB_OUT.EN <= '1';
			when others => FSM_OB_OUT.EN <= '0';
		end case;
	end process;

end Behavioral;

