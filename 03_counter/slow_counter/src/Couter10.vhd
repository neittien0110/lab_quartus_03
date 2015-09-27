-------------------------------------------------------------------------------
--
-- Title       : Counter10
-- Design      : slow_counter
-- Author      : Nguyen Duc Tien
-- Company     : Home
--
-------------------------------------------------------------------------------
--
-- File        : Counter10.vhd
-- Generated   : Fri Sep 11 13:07:08 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Counter10} architecture {Counter10}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Counter10 is
	 port(
		 CLK : in STD_LOGIC;
		 aReset : in STD_LOGIC;
		 Co : out STD_LOGIC;
		 Q : buffer STD_LOGIC_VECTOR(3 downto 0)
	     );
end Counter10;

--}} End of automatically maintained section

architecture Counter10 of Counter10 is
begin
	process (CLK, aReset)
    begin                  
        if aReset = '1' then
            Q <= "0000";  	   
			Co <= '0';
        elsif rising_edge(CLK) then
            Q <= Q + 1;
            if (Q = "1001") then
                Q <= "0000";	
				Co <= '1';
            end if;  
            if (Q = "0101") then
				Co <= '0';
            end if;  
		end if;    
    end process;       
end Counter10;
