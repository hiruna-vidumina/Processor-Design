//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2022 04:20:30 PM
// Design Name: 
// Module Name: CPU_CLOCK_GENERATOR
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


module CPU_CLOCK_GENERATOR
(
    input MAIN_CLOCK, PROCESS_FINISHED,
    output reg TICK = 1'b1
);
    always @ (posedge MAIN_CLOCK)
        begin
            if (~PROCESS_FINISHED)
                TICK = ~TICK;
            else
                TICK = 1'b0;
        end
endmodule
