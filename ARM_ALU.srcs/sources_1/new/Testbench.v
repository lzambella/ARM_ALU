`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2018 01:13:38 PM
// Design Name: 
// Module Name: Testbench
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


module Testbench(
        input clock,
        input [5:0] a, // next 6 bits on board
        input [5:0] b, // next six bits
        input [4:0] opcode, //4 MSB switches on board
        input switch,
        output[6:0] disp_out, // seven segment display output
        output reg[7:0] anode // annode segments for each display
    );
    reg [3:0] disp_in;
    wire[15:0] out; // ALU Output
    ALU alu(opcode, a, b, out); // ARM compatible ALU
    SSegDisp disp(disp_in, disp_out);
    reg [3:0] A; // register for first digit
    reg [3:0] B; // register for second
    reg [3:0] C;
    reg [3:0] D;
    
    
    always @ switch begin
        A = out[3:0];
        B = out[7:4];
        C = out[11:8];
        D = out[15:12];
    end
    
    reg [16:0] count;
    
    always @ (posedge clock) begin
        count <= count + 1;
    end
    
    // Multiplexer for 8 seven segment display
    always @ (*) begin
        case (count[15:13])        
            'b000: begin   
                disp_in = A;
                anode = 'b11111110;
            end
            'b001: begin
                disp_in = B;
                anode = 'b11111101;
            end
            'b010: begin
                disp_in = C;
                anode = 'b11111011;
            end
            'b011: begin   
                disp_in = D;
                anode = 'b11110111;
            end
            'b100: begin
                anode = 'b11101111;
                disp_in = 'b0000;
            end
            'b101: begin
                anode = 'b11011111;
                disp_in = 'b0000;
            end
            'b110: begin
                anode = 'b10111111;
                disp_in = 'b0000;
            end
            'b111: begin
                anode = 'b01111111;
                disp_in = 'b0000;
            end
        endcase
    end
   // Waveform testbench
   /*
   always begin
        #5
        opcode = 'b0000;
        
        #5
        opcode = 'b0001;
        
        #5
        opcode = 'b0010;
        
        #5
        opcode = 'b0110;
        
        #5
        opcode = 'b0111;
        
        #5
        opcode = 'b1100;
    end
    */
    /*
    initial begin
        disp_in = out;
        opcode = 'b0010;
        b = 'h12FE;
        a = 'h0040;
        sim_clock = 0;
        switch = 0;
        count = 0;
    end
    */
endmodule
