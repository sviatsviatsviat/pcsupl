--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:45:59 03/07/2020
-- Design Name:   
-- Module Name:   E:/Master Degree/PCSUPL/Accum/TB_ACCUM_UNIT.vhd
-- Project Name:  Accum
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ACCUM_UNIT
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

ENTITY TB_ACCUM_UNIT IS
END TB_ACCUM_UNIT;
 
ARCHITECTURE behavior OF TB_ACCUM_UNIT IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ACCUM_UNIT
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         MODE : IN  std_logic_vector(1 downto 0);
         ACCUM_EN : IN  std_logic;
         DATA_SEL : IN  std_logic;
         IR : IN  std_logic_vector(7 downto 0);
         RAM : IN  std_logic_vector(7 downto 0);
         DOUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal MODE : std_logic_vector(1 downto 0) := (others => '0');
   signal ACCUM_EN : std_logic := '0';
   signal DATA_SEL : std_logic := '0';
   signal IR : std_logic_vector(7 downto 0) := (others => '0');
   signal RAM : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal DOUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	
	procedure SIGNAL_PULSE (signal s_out: out std_logic) is
	begin
		s_out <= '0'; wait for CLK_period;
		s_out <= '1'; wait for CLK_period;
		s_out <= '0'; wait for CLK_period;
	end SIGNAL_PULSE;
	
	procedure RUN_CMD (
		constant command : in std_logic_vector(1 downto 0);
		signal	MODE	  : out std_logic_vector(1 downto 0);
		signal 	ACCUM_EN	  : out std_logic ) is
	begin
		MODE 		<= command;
		ACCUM_EN	<= '1';
		wait for CLK_period;
		ACCUM_EN	<= '0';
		wait for CLK_period;
	end RUN_CMD;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ACCUM_UNIT PORT MAP (
          CLK => CLK,
          RST => RST,
          MODE => MODE,
          ACCUM_EN => ACCUM_EN,
          DATA_SEL => DATA_SEL,
          IR => IR,
          RAM => RAM,
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
wait for CLK_period/2;
		
		SIGNAL_PULSE(RST);
		
		IR 	<= "00000000";
		RAM 	<= "11111111";
		
		wait for CLK_period/2;
		DATA_SEL <= '0';
		RUN_CMD ("01", MODE, ACCUM_EN);
		assert DOUT = RAM report "Test failed: Invalid RAM write";
		DATA_SEL <= '1';
		RUN_CMD ("11", MODE, ACCUM_EN);
		assert DOUT = "11111110" report "Test failed: Invalid decrement";
		RUN_CMD ("01", MODE, ACCUM_EN);
		assert DOUT = IR report "Test failed: Invalid IR write";
		DATA_SEL <= '0';
		RUN_CMD ("10", MODE, ACCUM_EN);
		assert DOUT = "00000001" report "Test failed: Invalid increment";
		RUN_CMD ("00", MODE, ACCUM_EN);
		assert DOUT = "00000001" report "Test failed: Invalid store mode";
		
		report "End of simulation" severity failure;
   end process;

END;
