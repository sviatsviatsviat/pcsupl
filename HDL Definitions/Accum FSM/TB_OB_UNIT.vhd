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
use work.AccumMP.ALL;
 
ENTITY TB_OB_UNIT IS
END TB_OB_UNIT;
 
ARCHITECTURE behavior OF TB_OB_UNIT IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT OB_UNIT
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         EN : IN  std_logic;
         ACC : IN  std_logic_vector(7 downto 0);
         RAM : IN  std_logic_vector(7 downto 0);
         OPCODE : IN  std_logic_vector(3 downto 0);
         L_FLAG : OUT  std_logic;
         E_FLAG : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal EN : std_logic := '0';
   signal ACC : std_logic_vector(7 downto 0) := (others => '0');
   signal RAM : std_logic_vector(7 downto 0) := (others => '0');
   signal OPCODE : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
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
          ACC => ACC,
          RAM => RAM,
          OPCODE => OPCODE,
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
		
		ACC <= "00000001";
		RAM <= "00000001";
		
		RUN_CMD(CMP, OPCODE, EN); assert L_FLAG = '0' and E_FLAG = '1' report "Test failed: invalid equal" severity failure;
		RUN_CMD(JL, OPCODE, EN);  assert L_FLAG = '0' and E_FLAG = '0' report "Test failed: invalid equal" severity failure;
		RUN_CMD(JLE, OPCODE, EN); assert L_FLAG = '0' and E_FLAG = '1' report "Test failed: invalid equal" severity failure;
		RUN_CMD(J, OPCODE, EN);   assert L_FLAG = '0' and E_FLAG = '0' report "Test failed: invalid equal" severity failure;

		ACC <= "00000000";
		
		RUN_CMD(CMP, OPCODE, EN); assert L_FLAG = '1' and E_FLAG = '0' report "Test failed: invalid less" severity failure;
		RUN_CMD(JL, OPCODE, EN);  assert L_FLAG = '1' and E_FLAG = '0' report "Test failed: invalid less" severity failure;
		RUN_CMD(JLE, OPCODE, EN); assert L_FLAG = '1' and E_FLAG = '0' report "Test failed: invalid less" severity failure;
		RUN_CMD(J, OPCODE, EN);   assert L_FLAG = '0' and E_FLAG = '0' report "Test failed: invalid less" severity failure;
		
		ACC <= "00000010";
		
		RUN_CMD(CMP, OPCODE, EN); assert L_FLAG = '0' and E_FLAG = '0' report "Test failed: invalid greater" severity failure;
		RUN_CMD(JL, OPCODE, EN);  assert L_FLAG = '0' and E_FLAG = '0' report "Test failed: invalid greater" severity failure;
		RUN_CMD(JLE, OPCODE, EN); assert L_FLAG = '0' and E_FLAG = '0' report "Test failed: invalid greater" severity failure;
		RUN_CMD(J, OPCODE, EN);   assert L_FLAG = '0' and E_FLAG = '0' report "Test failed: invalid greater" severity failure;
		
		wait for CLK_period;
		report "End of simulation" severity failure;
		
   end process;

END;
