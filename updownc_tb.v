

module up_down_counter_tb;

reg clk;
reg reset;
reg up_down;

wire [3:0] count;

// DUT instantiation
up_down_counter uut (
    .clk(clk),
    .reset(reset),
    .up_down(up_down),
    .count(count)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    up_down = 1;

    // Reset
    #10;
    reset = 0;

    // Up counting
    up_down = 1;
    #80;

    // Down counting
    up_down = 0;
    #80;

    // Reset again
    reset = 1;
    #10;
    reset = 0;

    // Up counting again
    up_down = 1;
    #40;

    $finish;
end

// Monitor output
initial
begin
    $monitor("Time=%0t | Reset=%b | Up_Down=%b | Count=%d",
              $time, reset, up_down, count);
end

endmodule
