--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:21:13 03/01/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/PCSUPL/Stack/TB_RAM.vhd
-- Project Name:  Stack
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM
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
 
ENTITY TB_RAM IS
END TB_RAM;
 
ARCHITECTURE behavior OF TB_RAM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         W_EN : IN  std_logic;
         R_EN : IN  std_logic;
         ADR : IN  std_logic_vector(7 downto 0);
         DIN : IN  std_logic_vector(7 downto 0);
         DOUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal W_EN : std_logic := '0';
   signal R_EN : std_logic := '0';
   signal ADR : std_logic_vector(7 downto 0) := (others => '0');
   signal DIN : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal DOUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	constant WR_pattern: std_logic_vector(7 downto 0) := "10101010";
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM PORT MAP (
          CLK => CLK,
          RST => RST,
          W_EN => W_EN,
          R_EN => R_EN,
          ADR => ADR,
          DIN => DIN,
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
		wait for CLK_Period/2;
		
		RST <= '1'; wait for CLK_Period;
		RST <= '0'; wait for CLK_Period;
		DIN <= WR_pattern;
		
		for i in 0 to 15 loop
			ADR <= CONV_STD_LOGIC_Vector(i, 8); wait for CLK_period;
			R_EN <= '1'; wait for CLK_period;
			R_EN <= '0';
			
			if i = 0 then
				assert DOUT = "00001010" report "Test failed: Incorrect initial read" severity failure;
			elsif i = 1 then
				assert DOUT = "00000100" report "Test failed: Incorrect initial read" severity failure;
			end if;
			
			W_EN <= '1'; wait for CLK_period;
			W_EN <= '0';
		end loop;
		
		wait for CLK_Period;
		DIN <= ( others => '0');
		
		for i in 0 to 15 loop
			ADR <= CONV_STD_LOGIC_Vector(i, 8); wait for CLK_period;
			R_EN <= '1'; wait for CLK_period;
			R_EN <= '0';
			
			assert DOUT = WR_pattern report "Test failed: Incorrect write/read behaviour" severity failure;
		end loop;
		
		report "End of simulation" severity failure;
   end process;

END;
