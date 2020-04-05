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
use work.AccumMP.ALL;

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
           FSM_ACC_OUT : out  ACCUM_UNIT_INPUTS;
           FSM_ACC_IN : in  ACCUM_UNIT_OUTPUTS;
           FSM_OB_OUT : out  OB_UNIT_INPUTS;
           FSM_OB_IN : in  OB_UNIT_OUTPUTS);
end FSM;

architecture Behavioral of FSM is

type t_states is (
	s_IDLE,
	s_READ_ROM,
	s_WRITE_IR,
	s_DECODE,
	s_LOADC,
	s_LOADV,
	s_STORE,   
	s_WR,   
	s_RD,   
	s_CMP,  
	s_J, 
	s_JL, 
	s_JLE,  
	s_INC,  
	s_DEC,  
	s_ACC_INC,
	s_ACC_DEC,
	s_ACC_WR,
	s_OB_CMP,
	s_RAM_RD,
	s_RAM_SA,
	s_RAM_WR,
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
	
	process_FSM_NEXT: process(state.cur, START, opcode)
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
					when LOADV => state.nxt <= s_LOADV;
					when RD => state.nxt <= s_RD;
					when LOADC => state.nxt <= s_LOADC;
					when STORE => state.nxt <= s_STORE;
					when WR => state.nxt <= s_WR;
					when CMP => state.nxt <= s_CMP;
					when INC => state.nxt <= s_INC;
					when DEC => state.nxt <= s_DEC;
					when J => state.nxt <= s_J;
					when JL => state.nxt <= s_JL;
					when JLE => state.nxt <= s_JLE;
					when others => state.nxt <= s_ERROR;
				end case;
			when s_LOADC => state.nxt <= s_ACC_WR;
			when s_LOADV => state.nxt <= s_RAM_RD;
			when s_RD => state.nxt <= s_RAM_RD;
			when s_STORE => state.nxt <= s_RAM_WR;
			when s_WR => state.nxt <= s_RAM_RD;
			when s_CMP => state.nxt <= s_RAM_RD;
			when s_INC => state.nxt <= s_ACC_INC;
			when s_DEC => state.nxt <= s_ACC_DEC;
			when s_J => state.nxt <= s_PC_NEW;
			when s_JL => state.nxt <= s_PC_NEW;
			when s_JLE => state.nxt <= s_PC_NEW;
			when s_RAM_RD => 
				if (opcode = RD or opcode = LOADV) then
					state.nxt <= s_ACC_WR;
				elsif (opcode = WR) then
					state.nxt <= s_RAM_SA;
				elsif (opcode = CMP) then
					state.nxt <= s_OB_CMP;
				else
					state.nxt <= s_ERROR;
				end if;
			when s_RAM_SA => state.nxt <= s_RAM_WR;
			when s_ACC_WR => state.nxt <= s_PC_NEW;
			when s_ACC_INC => state.nxt <= s_PC_NEW;
			when s_ACC_DEC => state.nxt <= s_PC_NEW;
			when s_RAM_WR => state.nxt <= s_PC_NEW;
			when s_OB_CMP => state.nxt <= s_PC_NEW;
			when s_HALT => state.nxt <= s_HALT;
			when s_PC_NEW => state.nxt <= s_READ_ROM;
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
	FSM_RAM_OUT.ACC <= FSM_ACC_IN.DOUT;
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
			when s_LOADV | s_CMP | s_WR =>
				FSM_RAM_OUT.ADR_SEL <= '0';
				FSM_RAM_OUT.ADR_EN <= '1';
				FSM_RAM_OUT.DATA_EN <= '0';
				FSM_RAM_OUT.DATA_SEL <= '1';
			when s_RAM_SA =>
				FSM_RAM_OUT.ADR_SEL <= '1';
				FSM_RAM_OUT.ADR_EN <= '1';
				FSM_RAM_OUT.DATA_EN <= '1';
				FSM_RAM_OUT.DATA_SEL <= '0';
			when s_RD =>
				FSM_RAM_OUT.ADR_SEL <= '1';
				FSM_RAM_OUT.ADR_EN <= '1';
				FSM_RAM_OUT.DATA_EN <= '0';
				FSM_RAM_OUT.DATA_SEL <= '0';
			when s_STORE =>
				FSM_RAM_OUT.ADR_SEL <= '0';
				FSM_RAM_OUT.ADR_EN <= '1';
				FSM_RAM_OUT.DATA_EN <= '1';
				FSM_RAM_OUT.DATA_SEL <= '1';
			when others =>
				FSM_RAM_OUT.ADR_SEL <= '0';
				FSM_RAM_OUT.ADR_EN <= '0';
				FSM_RAM_OUT.DATA_EN <= '0';
				FSM_RAM_OUT.DATA_SEL <= '0';
		end case;
	end process;
	
	FSM_ACC_OUT.CLK <= CLK;
	FSM_ACC_OUT.RST <= RST;
	FSM_ACC_OUT.RAM <= FSM_RAM_IN.RAM_DATA;
	FSM_ACC_OUT.IR <= FSM_ROM_IN.IR(7 downto 0);
	
	process_OUT_ACC_IF_1: process(state.cur)
	begin
		case state.cur is
			when s_ACC_WR => FSM_ACC_OUT.ACCUM_EN <= '1';
			when s_ACC_INC => FSM_ACC_OUT.ACCUM_EN <= '1';
			when s_ACC_DEC => FSM_ACC_OUT.ACCUM_EN <= '1';
			when others => FSM_ACC_OUT.ACCUM_EN <= '0';
		end case;
	end process;
	
	process_OUT_ACC_IF_2: process(state.cur, opcode)
	begin
		case opcode is
			when LOADV | LOADC | RD => FSM_ACC_OUT.MODE <= "01";
			when INC => FSM_ACC_OUT.MODE <= "10";
			when DEC => FSM_ACC_OUT.MODE <= "11";
			when others => FSM_ACC_OUT.MODE <= "00";
		end case;
	end process;
	
	process_OUT_ACC_IF_3: process(state.cur, opcode)
	begin
		case opcode is
			when LOADC => FSM_ACC_OUT.DATA_SEL <= '1';
			when LOADV | RD => FSM_ACC_OUT.DATA_SEL <= '0';
			when others => FSM_ACC_OUT.DATA_SEL <= '0';
		end case;
	end process;
	
	FSM_OB_OUT.CLK <= CLK;
	FSM_OB_OUT.RST <= RST;
	FSM_OB_OUT.ACC <= FSM_ACC_IN.DOUT;
	FSM_OB_OUT.RAM <= FSM_RAM_IN.RAM_DATA;
	FSM_OB_OUT.OPCODE <= opcode;
	
	process_OUT_OB_IF: process(state.cur)
	begin
		case state.cur is
			when s_OB_CMP => FSM_OB_OUT.EN <= '1';
			when others => FSM_OB_OUT.EN <= '0';
		end case;
	end process;

end Behavioral;

