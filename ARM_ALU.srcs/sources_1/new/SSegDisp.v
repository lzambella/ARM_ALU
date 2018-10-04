`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2018 04:17:52 PM
// Design Name: 
// Module Name: SSegDisp
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


module SSegDisp(
        input[3:0] in,
        output reg[6:0] out
    );
    
    always @ in begin
        case (in)
            'b0000:  out = 'b1000000;
            'b0001:  out = 'b1111001;
            'b0010:  out = 'b0100100;
            'b0011:  out = 'b0110000;
            'b0100:  out = 'b0011001;
            'b0101:  out = 'b0010010;
            'b0110:  out = 'b0000010;
            'b0111:  out = 'b1111000;
            'b1000:  out = 'b0000000;
            'b1001:  out = 'b0011000;
            // hex val
            'b1010:  out = 'b0001000;
            'b1011:  out = 'b0000011;
            'b1100:  out = 'b1000110;
            'b1101:  out = 'b0100001;
            'b1110:  out = 'b0000110;
            'b1111:  out = 'b0001110;
            default: out = 'b1111111;
        endcase
    end
endmodule
