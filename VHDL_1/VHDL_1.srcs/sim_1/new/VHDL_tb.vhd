library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_bidirectional_counter is
-- 測試檔無對外接口
end tb_bidirectional_counter;

architecture Behavioral of tb_bidirectional_counter is
    -- 計數器的組件
    component bidirectional_counter
        Port ( clk   : in  STD_LOGIC;
               reset : in  STD_LOGIC;
               count : out INTEGER range 0 to 9);
    end component;

    -- 測試檔信號
    signal clk   : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal count : INTEGER range 0 to 9;

    -- 時鐘週期
    constant clk_period : time := 10 ns;

begin
    -- 計數器實例化
    uut: bidirectional_counter
        Port map (
            clk   => clk,
            reset => reset,
            count => count
        );

    -- 時鐘信號生成
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    -- 測試序列
    stim_proc: process
    begin
        -- 初始化並重置計數器
        reset <= '1';
        wait for clk_period;
        reset <= '0';
        
        -- 等待一段時間觀察計數器變化
        wait for 300 ns;
        
        -- 結束模擬
        wait;
    end process;
end Behavioral;