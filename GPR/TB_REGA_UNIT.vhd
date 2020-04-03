--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:36:45 04/01/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/PCSUPL/GPR/TB_REGA_UNIT.vhd
-- Project Name:  GPR
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: REGA_UNIT
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
use work.GPRMP.all;
  
ENTITY TB_REGA_UNIT IS
END TB_REGA_UNIT;
 
ARCHITECTURE behavior OF TB_REGA_UNIT IS 
 
    COMPONENT REGA_UNIT
    PORT(
         INPUTS : IN  REGA_UNIT_INPUTS;
         OUTPUTS : OUT  REGA_UNIT_OUTPUTS
        );
    END COMPONENT;
    
   signal INPUTS : REGA_UNIT_INPUTS;

   signal OUTPUTS : REGA_UNIT_OUTPUTS;
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: REGA_UNIT PORT MAP (
          INPUTS => INPUTS,
          OUTPUTS => OUTPUTS
        );

   -- Clock process definitions
   clk_process :process
   begin
		INPUTS.CLK <= '0';
		wait for clk_period/2;
		INPUTS.CLK <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		INPUTS.EN <= '0';
		INPUTS.RST <= '1';
		INPUTS.REG0_IN <= "10101010";
		INPUTS.REG1_IN <= "01010101";
	
		wait for clk_period/2;
		
		INPUTS.RST <= '1'; wait for clk_period;
		INPUTS.RST <= '0'; wait for clk_period;
		
		INPUTS.EN <= '1'; wait for clk_period;
		INPUTS.EN <= '0';
		
		assert OUTPUTS.REG0_OUT = "10101010" and OUTPUTS.REG1_OUT = "01010101" report "Test failed" severity failure;
		
		wait for clk_period;
		report "End of simulation" severity failure;
   end process;

END;
