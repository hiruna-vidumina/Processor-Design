//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2022 03:42:19 PM
// Design Name: 
// Module Name: MUX
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


module MUX_FOR_BUS_B
(
    // Inputs
    input [3:0] SELECT,
    input [15:0] PC, R1, R2, TR, R, AC, AR,
    input [7:0] INSTRUCTIONS, DATA_FROM_RAM,
    // Outputs
    output reg [15:0] BUS
);
    always @ (*) //SELECT or DATA_FROM_RAM or PC or R1 or R2 or TR or R or AC or INSTRUCTIONS or AR
    begin
        case(SELECT)
            4'd0: BUS = {8'b0000_0000, DATA_FROM_RAM};
            4'd1: BUS = PC;
            4'd2: BUS = R1;
            4'd3: BUS = R2;
            4'd4: BUS = TR;
            4'd5: BUS = R;
            4'd6: BUS = AC;
            4'd7: BUS = {8'b0000_0000, INSTRUCTIONS};
            4'd8: BUS = AR;
        endcase
    end
endmodule