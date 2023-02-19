//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2022 03:30:41 PM
// Design Name: 
// Module Name: Register
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


module REGISTER #(parameter BITS = 16)
(
    input CLOCK, LOAD, INCREMENT,
    input [BITS - 1:0] DATA,
    output reg [BITS - 1:0] OUT = 0
);
always @ (posedge CLOCK)
    begin
        if (LOAD)
            OUT <= DATA;
        if (INCREMENT)
            OUT <= OUT + 1;
    end
endmodule
