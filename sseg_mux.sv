`timescale 1ns / 1ps

module sseg_mux(
    input logic [7:0] cw, //clockwise
    input logic [7:0] ccw, //counter-clockwise
    input logic dir, //direction
    output logic [7:0] sseg //seven seg display
    );
    
    assign sseg = dir ? ccw : cw;
endmodule
