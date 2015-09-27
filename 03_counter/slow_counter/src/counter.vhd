-------------------------------------------------------------------------------
--
-- Tieu de     : \ counter\
-- Ten thiet ke: slow_counter
-- Tac gia     : Nguyen Duc Tien
-- Don vi      : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : counter.vhd
-- Ngay tao    : Mon Nov 25 01:14:42 2013
-- Tu file     : interface description file
-- Boi         : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Mo ta       : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {\ counter\} architecture {behavior}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity counter is
    generic
	( 
	BIT_NUM : integer := 4
	);
     port(
         aReset : in STD_LOGIC;
         CLK : in STD_LOGIC;
         Q : out STD_LOGIC_VECTOR(BIT_NUM-1 downto 0)
         );
end counter;

--}} End of automatically maintained section

architecture behavior of counter is
signal adder_value: STD_LOGIC_VECTOR(BIT_NUM-1 downto 0); 
begin
    process (CLK, aReset)
    begin                  
        if aReset = '1' then
            adder_value <= (others => '0');  
        elsif rising_edge(CLK) then
            adder_value <= adder_value + 1;
        end if;    
    end process;  
    Q <= adder_value;
end behavior;
