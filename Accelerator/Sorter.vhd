----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:49:37 03/15/2020 
-- Design Name: 
-- Module Name:    Sorter - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sorter is
    Port ( CLK : in  STD_LOGIC;
			  RST : in STD_LOGIC;
			  EN : in STD_LOGIC;
			  ASC : in STD_LOGIC;
			  W : in STD_LOGIC;
			  REG : buffer STD_LOGIC_VECTOR(31 downto 0);
			  INPUTS : in STD_LOGIC_VECTOR(31 downto 0);
           HALT : out  STD_LOGIC);
end Sorter;

architecture Behavioral of Sorter is

component CMP_UNIT is
    Port ( ASC : in STD_LOGIC;
			  IN0 : in STD_LOGIC_VECTOR (7 downto 0);
			  IN1 : in STD_LOGIC_VECTOR (7 downto 0);
           REG0 : out  STD_LOGIC_VECTOR (7 downto 0);
           REG1 : out  STD_LOGIC_VECTOR (7 downto 0);
			  XCHG : out STD_LOGIC);
end component CMP_UNIT;

--signal reg: STD_LOGIC_VECTOR(31 downto 0); --:= "00100000" & "10000000" & "00000100" & "01000000";
signal cmp_in, cmp_out: STD_LOGIC_VECTOR(31 downto 0);
signal xchg: STD_LOGIC_VECTOR(1 downto 0);

signal mov: boolean := False;

begin

	process_WR: process(CLK, RST, W, mov, cmp_out, INPUTS)
	begin
		if (RST = '1') then
			reg <= (others => '0');
			HALT <= '0';
		elsif (W = '1') then
			if (rising_edge(CLK)) then
				reg <= INPUTS;
			end if;
		elsif (EN = '1') then
			if (falling_edge(CLK)) then
				mov <= not mov;
				if (mov) then
					reg(31 downto 24) <= cmp_out(31 downto 24);
					reg(23 downto 8) <= cmp_out(15 downto 0);
					reg(7 downto 0) <= cmp_out(23 downto 16);
					if (xchg = "00") then
						HALT <= '1';
					else
						HALT <= '0';
					end if;
				else
					reg <= cmp_out;
				end if;
			end if;
		end if;
	end process;

	process_EN: process(CLK, EN, mov, cmp_out, xchg, reg)
	begin
		if (EN = '1') then
			if (rising_edge(CLK)) then
				if (mov) then
					cmp_in(31 downto 24) <= reg(31 downto 24);
					cmp_in(23 downto 16) <= reg(7 downto 0);
					cmp_in(15 downto 0) <= reg(23 downto 8);
				else
					cmp_in <= reg;
				end if;
			end if;
		end if;
	end process;

	U_CMP_0 : CMP_UNIT port map(ASC, cmp_in(31 downto 24), cmp_in(23 downto 16), cmp_out(31 downto 24), cmp_out(23 downto 16), xchg(1));
	U_CMP_1 : CMP_UNIT port map(ASC, cmp_in(15 downto 8), cmp_in(7 downto 0), cmp_out(15 downto 8), cmp_out(7 downto 0), xchg(0));

end Behavioral;

