`timescale 1ns / 1ps

module an_mux(
    input logic [3:0] cw, //clockwise
    input logic [3:0] ccw, //counter-clock wise
    input logic dir, //direction
    output logic [3:0] an //enable
    );
    
    assign an = dir ? ccw : cw;
endmodule