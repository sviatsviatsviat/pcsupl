--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:39:00 03/02/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/PCSUPL/Stack/TB_OB_UNIT.vhd
-- Project Name:  Stack
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: OB_UNIT
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work;
use work.GPRMP.ALL;
 
ENTITY TB_OB_UNIT IS
END TB_OB_UNIT;
 
ARCHITECTURE behavior OF TB_OB_UNIT IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT OB_UNIT
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
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal EN : std_logic := '0';
   signal RAM0 : std_logic_vector(7 downto 0) := (others => '0');
   signal RAM1 : std_logic_vector(7 downto 0) := (others => '0');
	signal IR2 : BYTE;
   signal OPCODE : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
	signal RESULT : BYTE;
   signal L_FLAG : std_logic;
   signal E_FLAG : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	
	procedure RUN_CMD(
		constant command 	: in NIBBLE;
		signal opcode		: out NIBBLE;
		signal enable		: out std_logic 
		) is
	begin
		opcode <= command;
		wait for CLK_period;
		enable <= '1'; wait for CLK_period;
		enable <= '0';
	end RUN_CMD;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: OB_UNIT PORT MAP (
          CLK => CLK,
          RST => RST,
          EN => EN,
          RAM0 => RAM0,
          RAM1 => RAM1,
			 IR2 => IR2,
          OPCODE => OPCODE,
			 RESULT => RESULT,
          L_FLAG => L_FLAG,
          E_FLAG => E_FLAG
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
   begin		
		wait for CLK_period / 2;
		
		RST <= '1'; wait for CLK_period;
		RST <= '0'; wait for CLK_period;
		
		RAM0 <= "00000001";
		RAM1 <= "00000001";
		IR2  <= "00000000";
		
		RUN_CMD(TEST, OPCODE, EN); assert L_FLAG = '0' and E_FLAG = '1' report "Test failed" severity failure;
		RUN_CMD(JL, OPCODE, EN);   assert L_FLAG = '0' and E_FLAG = '1' report "Test failed" severity failure;
		RUN_CMD(JLE, OPCODE, EN);  assert L_FLAG = '0' and E_FLAG = '1' report "Test failed" severity failure;
		RUN_CMD(J, OPCODE, EN);    assert L_FLAG = '0' and E_FLAG = '1' report "Test failed" severity failure;
		
		RUN_CMD(INC, OPCODE, EN);  assert RESULT = "00000010" report "Test failed" severity failure;
		RAM0 <= RESULT;
		
		RUN_CMD(TEST, OPCODE, EN); assert L_FLAG = '1' and E_FLAG = '0' report "Test failed" severity failure;
		RUN_CMD(JL, OPCODE, EN);	assert L_FLAG = '1' and E_FLAG = '0' report "Test failed" severity failure;
		RUN_CMD(JLE, OPCODE, EN);	assert L_FLAG = '1' and E_FLAG = '0' report "Test failed" severity failure;
		RUN_CMD(J, OPCODE, EN);		assert L_FLAG = '1' and E_FLAG = '0' report "Test failed" severity failure;
		
		RUN_CMD(DEC, OPCODE, EN);	assert RESULT = "00000001" report "Test failed" severity failure;
		RAM0 <= RESULT;
		
		RUN_CMD(TESTC, OPCODE, EN); assert L_FLAG = '1' and E_FLAG = '0' report "Test failed" severity failure;
		RUN_CMD(JL, OPCODE, EN);	 assert L_FLAG = '1' and E_FLAG = '0' report "Test failed" severity failure;	
		RUN_CMD(JLE, OPCODE, EN);   assert L_FLAG = '1' and E_FLAG = '0' report "Test failed" severity failure;
		RUN_CMD(J, OPCODE, EN);		 assert L_FLAG = '1' and E_FLAG = '0' report "Test failed" severity failure;
		
		wait for CLK_period;
		report "End of simulation" severity failure;
		
   end process;

END;
