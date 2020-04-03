--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:51:45 03/01/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/PCSUPL/Stack/TB_ROM_UNIT.vhd
-- Project Name:  Stack
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ROM_UNIT
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
library work;
use work.AccumMP.ALL;
 
ENTITY TB_ROM_UNIT IS
END TB_ROM_UNIT;
 
ARCHITECTURE behavior OF TB_ROM_UNIT IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM_UNIT
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         PC_EN : IN  std_logic;
         IR_EN : IN  std_logic;
         ROM_EN : IN  std_logic;
         L : IN  std_logic;
         E : IN  std_logic;
         IR_OUT : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal PC_EN : std_logic := '0';
   signal IR_EN : std_logic := '0';
   signal ROM_EN : std_logic := '0';
   signal L : std_logic := '0';
   signal E : std_logic := '0';

 	--Outputs
   signal IR_OUT : std_logic_vector(11 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	
	type t_micro_instruction is (
		iLOADC,
		iLOADV,
		iSTORE, 
		iWR,   
		iRD,   
		iCMP,  
		iJ,    
		iJL,   
		iJLE,   
		iINC,  
		iDEC,  
		iSTOP,
		iNON);
		
	signal m_inst: t_micro_instruction;
	signal opcode: std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Code of instruction
	opcode <= IR_OUT(11 downto 8);
	
	-- Deocder
	with opcode select m_inst <=
		iLOADC when LOADC,
		iLOADV when LOADV,
		iSTORE when STORE,  
		iWR    when WR,   
		iRD    when RD,   
		iCMP   when CMP,  
		iJ     when J,    
		iJL    when JL,   
		iJLE 	 when JLE,   
		iINC 	 when INC,  
		iDEC 	 when DEC,  
		iSTOP  when STOP,
		iNON   when others;
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM_UNIT PORT MAP (
          CLK => CLK,
          RST => RST,
          PC_EN => PC_EN,
          IR_EN => IR_EN,
          ROM_EN => ROM_EN,
          L => L,
          E => E,
          IR_OUT => IR_OUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
	variable i  : integer := 0;
	
   begin		
		wait for CLK_Period / 2;
		
		-- active reset
		RST <= '1'; wait for CLK_Period;
		RST <= '0'; wait for CLK_Period;
		
		-- fecth instructions until stop
		while (m_inst /= iSTOP ) loop
			ROM_EN <= '1'; wait for CLK_Period;
			ROM_EN <= '0';
			-- write instruction into register
			IR_EN <= '1'; wait for CLK_Period;
			IR_EN <= '0';
			-- Simulate iterations
			if (m_inst = iCMP) then
				if (i < 3) then
					L <= '1';
					E <= '0';
				elsif (i < 4) then
					L <= '0';
					E <= '0';
			   elsif (i < 5) then
					L <= '1';
					E <= '0';
				else
					L <= '0';
					E <= '1';
				end if;
				i := i+1;
			else
				L <= '0';
				E <= '0';
			end if;
			
			assert i < 100 report "Test failed: endless loop";
			
			-- write next address to counter
			PC_EN <= '1'; wait for CLK_Period;
			PC_EN <= '0';
		end loop;
		
		wait for CLK_Period;
		
		report "End of simulation" severity failure;
		
   end process;

END;
