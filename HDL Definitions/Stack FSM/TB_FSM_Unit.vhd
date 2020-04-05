--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:00:43 03/03/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/PCSUPL/Stack/TB_FSM_Unit.vhd
-- Project Name:  Stack
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FSM_UNIT
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_FSM_Unit IS
END TB_FSM_Unit;
 
ARCHITECTURE behavior OF TB_FSM_Unit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM_UNIT
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         START : IN  std_logic;
         HALT : OUT  std_logic;
         ERROR : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal START : std_logic := '0';

 	--Outputs
   signal HALT : std_logic;
   signal ERROR : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM_UNIT PORT MAP (
          CLK => CLK,
          RST => RST,
          START => START,
          HALT => HALT,
          ERROR => ERROR
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
      -- hold reset state for 100 ns.
      wait for CLK_period/2;
		
		RST <= '1'; wait for CLK_period;
		RST <= '0'; wait for CLK_period;
		
		START <= '1'; wait for CLK_period;
		START <= '0'; wait for CLK_period;
		
		wait until HALT='1';

      wait for CLK_period*2;

      -- insert stimulus here 
		
		report "End of simulation" severity failure;

      wait;
   end process;

END;
