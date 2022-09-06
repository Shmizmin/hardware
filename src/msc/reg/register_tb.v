`timescale 1ns / 100ps
`include "register.v"

module register_tb;

reg clk = 0, rst = 0;
reg en = 1;

reg[7:0] d;
wire[7:0] q;

always #1 clk = !clk;

initial $dumpfile("register_tb.vcd");
initial $dumpvars(0, register_tb);

register_rst r
(
    .d(d),
    .en(en),
    .clk(clk),
    .rst(rst),
    .q(q)
);

initial
begin
    #5 d = 31;
    #5 d = 127;
    #5 en = 0;
    #5 d = 12;
    #5 en = 1; d = 100; rst = 1;
    #5 en = 0; rst = 0;
    #5 $finish;
end
endmodule
