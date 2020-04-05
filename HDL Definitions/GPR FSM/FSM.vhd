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
use work.GPRMP.ALL;

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
           FSM_REGA_OUT : out  REGA_UNIT_INPUTS;
           FSM_REGA_IN : in  REGA_UNIT_OUTPUTS;
           FSM_OB_OUT : out  OB_UNIT_INPUTS;
           FSM_OB_IN : in  OB_UNIT_OUTPUTS);
end FSM;

architecture Behavioral of FSM is

type t_states is (
	s_IDLE,
	s_READ_ROM,
	s_WRITE_IR,
	s_DECODE,
	s_MOVC,
	s_MOV,
	s_MOVA,   
	s_WR,   
	s_RD,   
	s_TESTC,
	s_TEST,
	s_J, 
	s_JL, 
	s_JLE,  
	s_INC,  
	s_DEC,  
	s_OB_INC,
	s_OB_DEC,
	s_ACC_WR,
	s_OB_TEST,
	s_RAM_RD,
	s_RAM_WR,
	s_RAM_SA,
	s_REGA_WR,
	s_REGA_RD,
	s_PC_NEW,
	s_HALT,
	s_ERROR
);

type t_fsm_state is record
	cur, nxt: t_states;
end record;

signal state: t_fsm_state;
signal opcode: NIBBLE;
signal ir1, ir2 : BYTE;

begin

	opcode <= FSM_ROM_IN.IR(19 downto 16);
	ir1 <= FSM_ROM_IN.IR(15 downto 8);
	ir2 <= FSM_ROM_IN.IR(7 downto 0);

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
					when MOVC => state.nxt <= s_MOVC;
					when MOV => state.nxt <= s_MOV;
					when MOVA => state.nxt <= s_MOVA;
					when RD => state.nxt <= s_RD;
					when WR => state.nxt <= s_WR;
					when TEST => state.nxt <= s_TEST;
					when TESTC => state.nxt <= s_TESTC;
					when INC => state.nxt <= s_INC;
					when DEC => state.nxt <= s_DEC;
					when J => state.nxt <= s_J;
					when JL => state.nxt <= s_JL;
					when JLE => state.nxt <= s_JLE;
					when others => state.nxt <= s_ERROR;
				end case;
			when s_MOVC => state.nxt <= s_RAM_WR;
			when s_MOV => state.nxt <= s_RAM_RD;
			when s_MOVA => state.nxt <= s_RAM_RD;
			when s_RD => state.nxt <= s_RAM_RD;
			when s_WR => state.nxt <= s_RAM_RD;
			when s_TESTC => state.nxt <= s_RAM_RD;
			when s_TEST => state.nxt <= s_RAM_RD;
			when s_INC => state.nxt <= s_RAM_RD;
			when s_DEC => state.nxt <= s_RAM_RD;
			when s_J => state.nxt <= s_PC_NEW;
			when s_JL => state.nxt <= s_PC_NEW;
			when s_JLE => state.nxt <= s_PC_NEW;
			when s_RAM_RD =>
				if (opcode = MOV or opcode = RD or opcode = WR) then
					state.nxt <= s_RAM_SA;
				elsif (opcode = TESTC or opcode = TEST) then
					state.nxt <= s_OB_TEST;
				elsif (opcode = MOVA) then
					state.nxt <= s_REGA_WR;
				elsif (opcode = INC) then
					state.nxt <= s_OB_INC;
				elsif (opcode = DEC) then
					state.nxt <= s_OB_DEC;
				else
					state.nxt <= s_ERROR;
				end if;
			when s_RAM_SA => state.nxt <= s_RAM_WR;
			when s_REGA_WR => state.nxt <= s_PC_NEW;
			when s_OB_INC => state.nxt <= s_RAM_SA;
			when s_OB_DEC => state.nxt <= s_RAM_SA;
			when s_RAM_WR => state.nxt <= s_PC_NEW;
			when s_OB_TEST => state.nxt <= s_PC_NEW;
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
	FSM_RAM_OUT.OB_RESULT <= FSM_OB_IN.RESULT;
	FSM_RAM_OUT.IR1 <= ir1;
	FSM_RAM_OUT.IR2 <= ir2;
	FSM_RAM_OUT.REGA0 <= FSM_REGA_IN.REG0_OUT;
	FSM_RAM_OUT.REGA1 <= FSM_REGA_IN.REG1_OUT;

	process_OUT_RAM_IF_1: process(state.cur, opcode)
	begin
		case state.cur is 
			when s_RAM_RD =>
				if (opcode = TEST or opcode = MOVA) then
					FSM_RAM_OUT.R0_EN <= '1';
					FSM_RAM_OUT.R1_EN <= '1';
					FSM_RAM_OUT.W0_EN <= '0';
				else
					FSM_RAM_OUT.R0_EN <= '1';
					FSM_RAM_OUT.R1_EN <= '0';
					FSM_RAM_OUT.W0_EN <= '0';
				end if;
			when s_RAM_WR =>
				FSM_RAM_OUT.R0_EN <= '0';
				FSM_RAM_OUT.R1_EN <= '0';
				FSM_RAM_OUT.W0_EN <= '1';
			when others =>
				FSM_RAM_OUT.R0_EN <= '0';
				FSM_RAM_OUT.R1_EN <= '0';
				FSM_RAM_OUT.W0_EN <= '0';
		end case;
	end process;
	
	process_OUT_RAM_IF_2: process(state.cur, opcode, ir1, ir2)
	begin
		case state.cur is
			when s_MOVC =>
				FSM_RAM_OUT.ADR0_SEL <= "00";
				FSM_RAM_OUT.ADR0_EN <= '1';
				FSM_RAM_OUT.ADR1_SEL <= '0';
				FSM_RAM_OUT.ADR1_EN <= '0';
				FSM_RAM_OUT.DATA_EN <= '1';
				FSM_RAM_OUT.DATA_SEL <= "00";
			when s_MOV | s_WR =>
				FSM_RAM_OUT.ADR0_SEL <= "01";
				FSM_RAM_OUT.ADR0_EN <= '1';
				FSM_RAM_OUT.ADR1_SEL <= '0';
				FSM_RAM_OUT.ADR1_EN <= '0';
				FSM_RAM_OUT.DATA_EN <= '0';
				FSM_RAM_OUT.DATA_SEL <= "00";
			when s_MOVA | s_TEST =>
				FSM_RAM_OUT.ADR0_SEL <= "00";
				FSM_RAM_OUT.ADR0_EN <= '1';
				FSM_RAM_OUT.ADR1_SEL <= '1';
				FSM_RAM_OUT.ADR1_EN <= '1';
				FSM_RAM_OUT.DATA_EN <= '0';
				FSM_RAM_OUT.DATA_SEL <= "00";
			when s_RD =>
				FSM_RAM_OUT.ADR0_SEL <= "1" & ir2(0);
				FSM_RAM_OUT.ADR0_EN <= '1';
				FSM_RAM_OUT.ADR1_SEL <= '0';
				FSM_RAM_OUT.ADR1_EN <= '0';
				FSM_RAM_OUT.DATA_EN <= '0';
				FSM_RAM_OUT.DATA_SEL <= "00";
			when s_TESTC | s_INC | s_DEC =>
				FSM_RAM_OUT.ADR0_SEL <= "00";
				FSM_RAM_OUT.ADR0_EN <= '1';
				FSM_RAM_OUT.ADR1_SEL <= '0';
				FSM_RAM_OUT.ADR1_EN <= '0';
				FSM_RAM_OUT.DATA_EN <= '0';
				FSM_RAM_OUT.DATA_SEL <= "00";
			when s_RAM_SA =>
				if (opcode = MOV or opcode = RD) then				
					FSM_RAM_OUT.ADR0_SEL <= "00";
					FSM_RAM_OUT.ADR0_EN <= '1';
					FSM_RAM_OUT.ADR1_SEL <= '0';
					FSM_RAM_OUT.ADR1_EN <= '0';
					FSM_RAM_OUT.DATA_EN <= '1';
					FSM_RAM_OUT.DATA_SEL <= "11";
				elsif (opcode = INC or opcode = DEC) then
					FSM_RAM_OUT.ADR0_SEL <= "00";
					FSM_RAM_OUT.ADR0_EN <= '1';
					FSM_RAM_OUT.ADR1_SEL <= '0';
					FSM_RAM_OUT.ADR1_EN <= '0';
					FSM_RAM_OUT.DATA_EN <= '1';
					FSM_RAM_OUT.DATA_SEL <= "01";
				elsif (opcode = WR) then
					FSM_RAM_OUT.ADR0_SEL <= "1" & ir1(0);
					FSM_RAM_OUT.ADR0_EN <= '1';
					FSM_RAM_OUT.ADR1_SEL <= '0';
					FSM_RAM_OUT.ADR1_EN <= '0';
					FSM_RAM_OUT.DATA_EN <= '1';
					FSM_RAM_OUT.DATA_SEL <= "11";
				else
					FSM_RAM_OUT.ADR0_SEL <= "00";
					FSM_RAM_OUT.ADR0_EN <= '0';
					FSM_RAM_OUT.ADR1_SEL <= '0';
					FSM_RAM_OUT.ADR1_EN <= '0';
					FSM_RAM_OUT.DATA_EN <= '0';
					FSM_RAM_OUT.DATA_SEL <= "00";
				end if;
			when others =>
				FSM_RAM_OUT.ADR0_SEL <= "00";
				FSM_RAM_OUT.ADR0_EN <= '0';
				FSM_RAM_OUT.ADR1_SEL <= '0';
				FSM_RAM_OUT.ADR1_EN <= '0';
				FSM_RAM_OUT.DATA_EN <= '0';
				FSM_RAM_OUT.DATA_SEL <= "00";
		end case;
	end process;
	
	FSM_REGA_OUT.CLK <= CLK;
	FSM_REGA_OUT.RST <= RST;
	FSM_REGA_OUT.REG0_IN <= FSM_RAM_IN.DOUT0;
	FSM_REGA_OUT.REG1_IN <= FSM_RAM_IN.DOUT1;
	
	process_REGA: process(state.cur)
	begin
		case state.cur is
			when s_REGA_WR => FSM_REGA_OUT.EN <= '1';
			when others => FSM_REGA_OUT.EN <= '0';
		end case;
	end process;
	
	FSM_OB_OUT.CLK <= CLK;
	FSM_OB_OUT.RST <= RST;
	FSM_OB_OUT.RAM0 <= FSM_RAM_IN.DOUT0;
	FSM_OB_OUT.RAM1 <= FSM_RAM_IN.DOUT1;
	FSM_OB_OUT.OPCODE <= opcode;
	FSM_OB_OUT.IR2 <= ir2;
	
	process_OUT_OB_IF: process(state.cur)
	begin
		case state.cur is
			when s_OB_TEST | s_OB_INC | s_OB_DEC => FSM_OB_OUT.EN <= '1';
			when others => FSM_OB_OUT.EN <= '0';
		end case;
	end process;

end Behavioral;

