-------------------------------------------------------------------------------
--
-- Tieu de     : counter50
-- Ten thiet ke: slow_counter
-- Tac gia     : Nguyen Duc Tien
-- Don vi      : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : counter50.vhd
-- Ngay tao    : Mon Nov 25 00:00:31 2013
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
--{entity {counter50} architecture {behavior}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_ARITH.all;   
use IEEE.STD_LOGIC_UNSIGNED.all;

--- @brief Bo dem tran 50, de chia tan so 50MHz thanh 1MHz 
--- @details Nguyen tac dem: 39, 40, 41.. 63, 39
---          Chi dem cho 25 boi vi sau khi cong 25 lan thi Carry Flag se thay doi tu 0 -> 1 
---          Sau do, bo cong tai dem tiep 25 lan nua thi Carry Flag se thay doi tu 1 -> 0  
--           Do do, tinh ca 2 lan la 50 chu ki CLK dau vao moi tao ra du 1 chu ki dau ra
entity counter50 is
     port(
         CLK : in STD_LOGIC;     --- Tin hieu dong ho dau vao. Kit DE2-150i, CLK=50MHz co san tren mainboard
         aReset: in STD_LOGIC;   --- Tin hieu reset a/p.
         G : buffer STD_LOGIC    --- Tin hieu sau khi tran bo cong, 
      );
end counter50;

--}} End of automatically maintained section

architecture behavior of counter50 is
signal adder_value: STD_LOGIC_VECTOR(6 downto 0);    --- Thanh ghi chua gia tri hien thoi cua bo dem
signal load_value: STD_LOGIC_VECTOR(5 downto 0):= "100111"; --- Gia tri nap khi tran = 2**6-25=39
begin       
    process (CLK, aReset)
    begin                  
        if aReset = '1' then
            adder_value <= '0' & load_value;  
        elsif rising_edge(CLK) then
            adder_value <= adder_value + 1;
            if (adder_value(5 downto 0) = "111111") then
                adder_value(5 downto 0) <= load_value;
            end if;    
        end if;    
    end process;                
    
    --- Dua gia tri bit carry, bit tran cua bo dem ra ngoai, thanh tin hieu G 1MHz.
    G <= adder_value(6);
end behavior;
