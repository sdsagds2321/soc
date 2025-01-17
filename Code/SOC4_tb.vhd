library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Breathing_LED_tb is
end Breathing_LED_tb;

architecture behavior of Breathing_LED_tb is

    -- Component declaration
    component Breathing_LED
        Port (
            i_clk     : in  STD_LOGIC;
            i_rst     : in  STD_LOGIC;
            led_out   : out STD_LOGIC
        );
    end component;

    -- Signals for testbench
    signal i_clk     : STD_LOGIC := '0';
    signal i_rst     : STD_LOGIC := '0';
    signal led_out   : STD_LOGIC;

    -- Clock period
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Breathing_LED
        Port map (
            i_clk     => i_clk,
            i_rst     => i_rst,
            led_out   => led_out
        );

    -- Clock generation
    clk_process :process
    begin
        i_clk <= '0';
        wait for clk_period / 2;
        i_clk <= '1';
        wait for clk_period / 2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initial reset
        i_rst <= '1';
        wait for 20 ns;
        i_rst <= '0';
        
        -- Let the simulation run for a while
        wait for 2000 ns;
        
        -- Test complete, end simulation
        assert false report "End of Simulation" severity note;
        wait;
    end process;

end behavior;








