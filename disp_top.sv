`timescale 1ns / 1ps

module disp_top(
    input logic clk, reset,
    input logic [1:0] sw, //enable and direction switches
    output logic [3:0] an,
    output logic [7:0] seg
    );
    
    logic a,b;
    logic [3:0] cw_an;
    logic [7:0] cwsseg;
    logic [3:0] ccw_an;
    logic [7:0] ccwsseg;

    disp_mux_cw disp_unit1(.clk(clk), .reset(1'b0), .en(a), .sseg(cwsseg), .an(cw_an));
    disp_mux_ccw disp_unit2(.clk(clk), .reset(1'b0), .en(a), .sseg(ccwsseg), .an(ccw_an));
    an_mux an_unit(.dir(b), .cw(cw_an), .ccw(ccw_an), .an(an));
    sseg_mux sseg_unit(.dir(b), .sseg(seg), .cw(cwsseg), .ccw(ccwsseg));

    assign a = sw [0];
    assign b = sw [1];
endmodule