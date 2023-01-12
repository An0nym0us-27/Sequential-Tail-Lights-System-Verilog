`timescale 1ns / 1ps

module disp_mux_ccw(
    input logic clk, reset, en,
    output logic [3:0] an,
    output logic [7:0] sseg 
    );
    localparam N = 27; 
    
    logic [N-1:0] q_reg;
    logic [N-1:0] q_next;
    
    
    always_ff@(posedge clk, posedge reset) //next state logic
        if(reset)
            q_reg <= 0;
        else
            q_reg <= q_next;
            
        assign q_next = (en) ? q_reg + 1: q_reg;
                
    always_comb //an enable logic
        case(q_reg[N-1:N-3])
            2'b00:
                begin
                    an = 4'b1110;
                    sseg [7:0] =  8'b11000110; //top square
                end
             2'b01:
                begin
                    an = 4'b1100;
                    sseg [7:0] =  8'b11000110; //bottom 
                end
            2'b10:
                begin
                    an = 4'b1000;
                    sseg [7:0] =  8'b11000110; //bottom 
                end
            default:
                begin
                    an = 4'b0000;
                    sseg [7:0] =  8'b11000110; //top square
                end
            endcase
            
endmodule