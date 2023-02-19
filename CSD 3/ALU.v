//`timescale 1 ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2022 03:34:27 PM
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


module ALU
(
    input [15:0] A_bus, B_bus,
    input [2:0] ALU_OP,
    output reg [15:0] C_bus,
    output reg FLAG_Z
);

parameter ADD = 3'd0, SUB = 3'd1, PASS = 3'd2, ZER = 3'd3, MUL4 = 3'd5, DIV2 =3'd6;

always @ (ALU_OP or A_bus or B_bus)
    begin
        case (ALU_OP)
            ADD:
               begin
                C_bus = A_bus + B_bus;
                FLAG_Z = 0;
               end
            SUB:
               begin
                C_bus = A_bus - B_bus;
                FLAG_Z = (C_bus == 16'd0) ? 1'b1 : 1'b0;
               end
            PASS:
                begin
                 C_bus = B_bus;
                 if (C_bus == 16'd0) FLAG_Z = 1;
                end
            ZER:
                begin
                    C_bus = 0;
                    FLAG_Z = 0;
                end
            MUL4:
                begin
                    C_bus = A_bus << 2;
                    FLAG_Z = 0;
                end
            DIV2:
                begin
                    C_bus = A_bus >> 1;
                    FLAG_Z = 0;
                end
        endcase
    end
endmodule