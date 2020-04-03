--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:03:58 03/01/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/PCSUPL/Stack/TB_ROM.vhd
-- Project Name:  Stack
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ROM
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

 
ENTITY TB_ROM IS
END TB_ROM;
 
ARCHITECTURE behavior OF TB_ROM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM
    PORT(
         ADR : IN  std_logic_vector(4 downto 0);
         CLK : IN  std_logic;
         EN : IN  std_logic;
         RST : IN  std_logic;
         DOUT : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ADR : std_logic_vector(4 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal EN : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal DOUT : std_logic_vector(11 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM PORT MAP (
          ADR => ADR,
          CLK => CLK,
          EN => EN,
          RST => RST,
          DOUT => DOUT
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
		
		RST <= '1'; 
		wait for CLK_Period;
		
		RST <= '0';
		wait for CLK_Period;
		
		for i in 0 to 30 loop
			ADR <= CONV_STD_LOGIC_VECTOR(i, 5) after 1 ns; 
			wait for CLK_Period;
			EN <= '1' after 1 ns;
			wait for CLK_Period;
			EN <= '0' after 1 ns;
		end loop;
		wait for CLK_Period;
		
		report "End of simulation" severity failure;
   end process;

END;
