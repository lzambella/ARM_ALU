`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2018 12:53:47 PM
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
    input [3:0] ctrl,
    input [63:0] in_a,
    input [63:0] in_b,
    output reg [63:0] out
    );
    always @ ctrl
    begin
        case (ctrl)
            'b0000: out = in_a & in_b;
            'b0001: out = in_a | in_b;
            'b0010: out = in_a + in_b;
            'b0110: out = in_a - in_b;
            'b0111: out = in_b;
            'b1100: out = !(in_a | in_b);
            default : out = 0;
        endcase
    end
endmodule
