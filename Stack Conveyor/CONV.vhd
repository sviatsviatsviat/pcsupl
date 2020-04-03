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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.StackMP.ALL;

entity CONV is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           START : in  STD_LOGIC;
           HALT : out  STD_LOGIC;
           ERROR : out  STD_LOGIC;
           ROM_OUT : out  C_ROM_UNIT_INPUTS;
           ROM_IN : in ROM_UNIT_OUTPUTS;
           RAM_OUT : out  C_RAM_UNIT_INPUTS;
           RAM_IN : in  RAM_UNIT_OUTPUTS;
           LIFO_OUT : out  C_LIFO_UNIT_INPUTS;
           LIFO_IN : in  LIFO_UNIT_OUTPUTS;
           OB_OUT : out  OB_UNIT_INPUTS;
           OB_IN : in  OB_UNIT_OUTPUTS);
end CONV;

architecture Behavioral of CONV is

-- Jonson's counter
signal JC: STD_LOGIC_VECTOR(3 downto 0);
signal GO, STP: STD_LOGIC;
signal F_EN, D_EN, EX_EN, LIFO_EN: STD_LOGIC;


-- CONV registers
signal RI_R : TRIBBLE; --instruction for decoding
signal RO_WE, RO_WL, RO_RE, RO_RL, DCODE: NIBBLE; -- opcodes
signal RA_WE, RA_WL, RA_RE, DARG: BYTE; -- arguments

signal PUSH_DATA, TOS, TOS_1: BYTE;

signal F_LOCKED, CJ_LOCKED, L, E: STD_LOGIC;

begin

-----------------------------------------
-- Synchronization signals
-----------------------------------------

	-- Jonson's sequel generation
	PJC: process(CLK, RST, JC, GO, STP)
	begin
		if (RST = '1') then
			JC <= "0000";
		elsif (rising_edge(CLK)) then
			if (GO = '1') then -- execution allowed
				if (JC /= "1111" or STP = '1') then -- conveyer is starting of stopping
					JC <= JC(2 downto 0) & not(JC(3));
				end if;
			end if;
		end if;
	end process;
	
	F_EN <= CLK and JC(0); --and (not LCONFLICT);
	D_EN <= CLK and JC(1);
	EX_EN <= CLK and JC(2); -- TODO sync with LIFO updates
	LIFO_EN <= CLK and JC(3);
							
	CJ_LOCKED <= '1' when (RO_RE = CMP or DCODE = CMP) else '0';

	-- Generate GO signals
	PGO: process(RST, Start, STP, JC)
	begin
		if (RST = '1') then
			GO <= '0';
		elsif (Start = '1') then
			GO <= '1';
		elsif (STP = '1' and JC = "0000") then
			GO <= '0';
		end if;
	end process;
	
	-- Generate STP signal
	PSTP: process(RST, ROM_IN.IR)
	begin
		if (RST = '1') then
			STP <= '0';
		elsif (ROM_IN.IR(11 downto 8) = STOP) then
			STP <= '1';
		end if;
	end process;

	-- Generate OUTPUT signal STOP
	PSTOP: process(RST, RO_RL)
	begin
		if (RST = '1') then
			HALT <= '0';
		elsif (RO_RL = STOP) then
			HALT <= '1';
		end if;
	end process;
	
	PERR: process(RST, LIFO_IN.EMPTY, LIFO_IN.FULL)
	begin
		if (RST = '1') then
			ERROR <= '0';
		elsif (LIFO_IN.EMPTY = '1' and LIFO_IN.FULL = '1') then
			ERROR <= '1';
		end if;
	end process;
	
-------------------------------------------	
	-- FETCH
-------------------------------------------

	ROM_OUT.EN 		<= F_EN;
	ROM_OUT.RST 	<= RST;
	ROM_OUT.ROM_EN <= not STP;
	ROM_OUT.STP 	<= STP;
	ROM_OUT.L	 	<= L;
	ROM_OUT.E	 	<= E;
	ROM_OUT.CJ_EN 	<= not CJ_LOCKED;
	
--------------------------------------------
	-- DECODE
--------------------------------------------
	
	PRIR: process(RST, D_EN, ROM_IN.IR)
	begin
		if (RST = '1') then
			RI_R <= (others => '0');
		elsif (rising_edge(D_EN)) then
			RI_R <= ROM_IN.IR;
		end if;
	end process;
	
	DCODE <= RI_R(11 downto 8);
	DARG <= RI_R(7 downto 0);
	
	PRORAWE: process(RST, D_EN, DCODE, DARG)
	begin
		if (RST = '1') then
			RO_WE <= NON;
			RA_WE <= NONE;
		elsif (falling_edge(D_EN)) then
			RO_WE <= DCODE;
			RA_WE <= DARG;
		end if;
	end process;
	
	RAM_CTRL_1: process(RST, RO_WE, TOS, TOS_1, RA_WE)
	begin
		if (RO_WE = WR) then
			RAM_OUT.ADR <= TOS;
			RAM_OUT.DIN <= TOS_1;
		elsif (RO_WE = RD) then
			RAM_OUT.ADR <= TOS;
			RAM_OUT.DIN <= (others => 'Z');
		elsif (RO_WE = PEEK) then
			RAM_OUT.ADR <= RA_WE;
			RAM_OUT.DIN <= TOS;
		elsif (RO_WE = PUSHV) then
			RAM_OUT.ADR <= RA_WE;
			RAM_OUT.DIN <= (others => 'Z');
		else
			RAM_OUT.ADR <= (others => 'Z');
			RAM_OUT.DIN <= (others => 'Z');
		end if;
	end process;
	
	--RAM_OUT.DIN <= RAM_DATA;
	--RAM_OUT.ADR <= RAM_ADDR;
	
	OB_CTRL: process(TOS, TOS_1)
	begin
		OB_OUT.ARG_1 <= TOS;
		OB_OUT.ARG_2 <= TOS_1;
	end process;
	
	RAM_CTRL_2: process(RO_WE)
	begin
		if (RO_WE = WR or RO_WE = PEEK) then
			RAM_OUT.R_EN <= '0';
			RAM_OUT.W_EN <= '1';
		elsif (RO_WE = RD or RO_WE = PUSHV) then
			RAM_OUT.R_EN <= '1';
			RAM_OUT.W_EN <= '0';
		else
			RAM_OUT.R_EN <= '0';
			RAM_OUT.W_EN <= '0';
		end if;
	end process;
	
	OB_CTRL_2: process(RO_WE)
	begin
		if (RO_WE = INC or RO_WE = DEC or RO_WE = CMP) then
			OB_OUT.EN <= '1';
		else
			OB_OUT.EN <= '0';
		end if;
	end process;
	
--------------------------------------------------
-- EXECUTE
--------------------------------------------------	

	OB_OUT.CLK <= EX_EN;
	OB_OUT.RST <= RST;
	OB_OUT.OPCODE <= RO_WE;
	
	RAM_OUT.CLK <= EX_EN;
	RAM_OUT.RST <= RST;

	PRORARE: process(RST, EX_EN, RO_WE, RA_WE)
	begin
		if (RST = '1') then
			RO_RE <= NON;
			RA_RE <= NONE;
		elsif (rising_edge(EX_EN)) then
			RO_RE <= RO_WE;
			RA_RE <= RA_WE;
		end if;
	end process;

	-- capture results of execution
	PRORAWL: process(RST, EX_EN, RO_RE, RA_RE)
	begin
		if (RST = '1') then
			RO_WL <= NON;
			RA_WL <= NONE;
		elsif (falling_edge(EX_EN)) then
			RO_WL <= RO_RE;
			RA_WL <= RA_RE;
		end if;
	end process;
	
	LIFO_OUT.PUSHDATA <= PUSH_DATA;
	
	LIFO_CTRL_0: process(RO_WL, RA_WL, RAM_IN.RAM_DATA, OB_IN.RESULT, OB_IN.L_FLAG, OB_IN.E_FLAG)
	begin		
		if (RO_WL = RD or RO_WL = PUSHV) then
			PUSH_DATA <= RAM_IN.RAM_DATA;
		elsif (RO_WL = INC or RO_WL = DEC) then
			PUSH_DATA <= OB_IN.RESULT;
		elsif (RO_WL = PUSHC) then
			PUSH_DATA <= RA_WL;
		elsif (RO_WL = CMP) then
			L <= OB_IN.L_FLAG;
			E <= OB_IN.E_FLAG;
		end if;
	end process;
	
	-- setup lifo mode
	LIFO_CTRL_1: process(RO_WL)
	begin
		case RO_WL is
			when PUSHV => LIFO_OUT.MODE <= "00";
			when PUSHC => LIFO_OUT.MODE <= "00";
			when RD => LIFO_OUT.MODE <= "11";
			when INC => LIFO_OUT.MODE <= "11";
			when DEC => LIFO_OUT.MODE <= "11";
			when WR => LIFO_OUT.MODE <= "10";
			when POP => LIFO_OUT.MODE <= "01";
			when others => LIFO_OUT.MODE <= "00";
		end case;
	end process;
	
	LIFO_CTRL_2: process(RO_WL)
	begin
		case RO_WL is
			when PUSHC | PUSHV | RD | INC | DEC | WR | POP => LIFO_OUT.LIFO_EN <= '1';
			when others => LIFO_OUT.LIFO_EN <= '0';
		end case;
	end process;
	
	LIFO_OUT.CLK <= LIFO_EN;
	LIFO_OUT.RST <= RST;
	
-------------------------------------------------
-- LIFO
-------------------------------------------------	

	TOS <= LIFO_IN.TOS;
	TOS_1 <= LIFO_IN.TOS_1;
	
	PRORARL: process(RST, LIFO_EN, RO_WL) --, RA_WL) 
	begin
		if (RST = '1') then
			RO_RL <= NON;
			--RA_RL <= (others => '0');
		elsif (rising_edge(LIFO_EN)) then
			RO_RL <= RO_WL;
			--RA_RL <= RA_WL;
		end if;
	end process;

end Behavioral;

