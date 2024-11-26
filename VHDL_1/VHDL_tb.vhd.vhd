library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_bidirectional_counter is
-- �����ɵL��~���f
end tb_bidirectional_counter;

architecture Behavioral of tb_bidirectional_counter is
    -- �p�ƾ����ե�
    component bidirectional_counter
        Port ( clk   : in  STD_LOGIC;
               reset : in  STD_LOGIC;
               count : out INTEGER range 0 to 9);
    end component;

    -- �����ɫH��
    signal clk   : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal count : INTEGER range 0 to 9;

    -- �����g��
    constant clk_period : time := 10 ns;

begin
    -- �p�ƾ���Ҥ�
    uut: bidirectional_counter
        Port map (
            clk   => clk,
            reset => reset,
            count => count
        );

    -- �����H���ͦ�
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    -- ���էǦC
    stim_proc: process
    begin
        -- ��l�ƨí��m�p�ƾ�
        reset <= '1';
        wait for clk_period;
        reset <= '0';
        
        -- ���ݤ@�q�ɶ��[��p�ƾ��ܤ�
        wait for 300 ns;
        
        -- ��������
        wait;
    end process;
end Behavioral;