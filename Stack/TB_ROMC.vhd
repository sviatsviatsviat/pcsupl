--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:50:25 03/18/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/PCSUPL/Stack/TB_ROMC.vhd
-- Project Name:  Stack
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ROMC
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
 
ENTITY TB_ROMC IS
END TB_ROMC;
 
ARCHITECTURE behavior OF TB_ROMC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROMC
    PORT(
         EN : IN  std_logic;
         RST : IN  std_logic;
         STP : IN  std_logic;
         CJ_EN : IN  std_logic;
         L : IN  std_logic;
         E : IN  std_logic;
         LOCKED : OUT  std_logic;
         ROM_ADR : OUT  std_logic_vector(4 downto 0);
         ROM_DATA : IN  std_logic_vector(11 downto 0);
         IR_OUT : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal EN : std_logic := '0';
   signal RST : std_logic := '0';
   signal STP : std_logic := '0';
   signal CJ_EN : std_logic := '0';
   signal L : std_logic := '0';
   signal E : std_logic := '0';
   signal ROM_DATA : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
   signal LOCKED : std_logic;
   signal ROM_ADR : std_logic_vector(4 downto 0);
   signal IR_OUT : std_logic_vector(11 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant EN_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROMC PORT MAP (
          EN => EN,
          RST => RST,
          STP => STP,
          CJ_EN => CJ_EN,
          L => L,
          E => E,
          LOCKED => LOCKED,
          ROM_ADR => ROM_ADR,
          ROM_DATA => ROM_DATA,
          IR_OUT => IR_OUT
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
