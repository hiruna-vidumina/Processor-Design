//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2022 03:45:54 PM
// Design Name: 
// Module Name: Control_Unit
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


module CONTROL_UNIT
(
    input CLOCK, FLAG_Z,
    input [7:0] INSTRUCTION,
    output reg FETCH, FINISH = 0,
    output [5:0] CMD,
    output reg [3:0] REG_IN_B_BUS,
    output reg [2:0] ALU_OP,
    output reg [12:0] SELECTORS,
    output reg status
);
    localparam
    FETCH1 = 6'd0, FETCH2 = 6'd1, FETCH3 = 6'd2, FETCH4 = 6'd3,
    CLAC = 6'd6, LDAC = 6'd7, STAC = 6'd8,
    MVACR = 6'd10, MVACR1 = 6'd11, MVACR2 = 6'd12, MVACTR = 6'd13, MVACAR = 6'd14,
    MVR = 6'd15, MVR1 = 6'd16, MVR2 = 6'd17, MVTR = 6'd18,
    MVAR = 6'd33,
    INCAR = 6'd19, INCR1 = 6'd20, INCR2 = 6'd21,
    JPNZ = 6'd22,
    JPNZY = 6'd23, JPNZY1 = 6'd34,
    JPNZN = 6'd24, JPNZN1 = 6'd25, JPNZN2 = 6'd26,
    ADD = 6'd27, SUB = 6'd28, MUL4 = 6'd29, DIV2 = 6'd30,
    ADDM = 6'd31, ADDM1 = 6'd35,
    NOP = 6'd5, END = 6'd32;
    localparam
    DATA_FROM_RAM = 4'd0, PC = 4'd1, R1 = 4'd2, R2 = 4'd3, TR = 4'd4,R = 4'd5, AC = 4'd6, INSTRUCTIONS = 4'd7, AR = 4'd8;
    localparam
    ADDAB = 3'd0, SUBAB = 3'd1, PASS = 3'd2, ZER = 3'd3, MUL4A = 3'd5, DIV2A = 3'd6;
    reg [5:0] CONTROL_COMMAND;
    reg [5:0] NEXT_COMMAND = FETCH1;
    always @ (negedge CLOCK) CONTROL_COMMAND <= NEXT_COMMAND;
    always @ (CONTROL_COMMAND or FLAG_Z or INSTRUCTION)
        case(CONTROL_COMMAND)
            FETCH1: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= INSTRUCTIONS;
                    ALU_OP <= PASS;
                    SELECTORS <= 13'b0_0000_0000_0000;
                    NEXT_COMMAND <= FETCH2;
                end
            FETCH2: // Checked
                begin
                    FETCH <= 1;
                    FINISH <= 0;
                    REG_IN_B_BUS <= INSTRUCTIONS;
                    ALU_OP <= PASS;
                    SELECTORS <= 13'b0_0000_0000_0000;
                    NEXT_COMMAND <= FETCH3;
                end
            FETCH3: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= DATA_FROM_RAM;
                    ALU_OP <= PASS;
                    SELECTORS <= 13'b1_0000_0000_0000;
                    NEXT_COMMAND <= FETCH4;
                end
            FETCH4: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= DATA_FROM_RAM;
                    ALU_OP <= PASS;
                    SELECTORS <= 13'b0_0000_0000_0000;
                    NEXT_COMMAND <= INSTRUCTION[5:0];
                end
            CLAC: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= DATA_FROM_RAM;
                    ALU_OP <= ZER;
                    SELECTORS <= 13'b0_0000_0000_0010;
                    NEXT_COMMAND <= FETCH1;
                end
            LDAC: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= DATA_FROM_RAM;
                    ALU_OP <= PASS;
                    SELECTORS <= 13'b0_0000_0000_0010;
                    NEXT_COMMAND <= FETCH1;
                end
            STAC: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= AC;
                    ALU_OP <= ADDAB;
                    SELECTORS <= 13'b0_0000_0000_0001;
                    NEXT_COMMAND <= FETCH1;
                end
            MVACR: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <=3'd6;
                    ALU_OP <= ADDAB;
                    SELECTORS <= 13'b0_0000_0000_0100;
                    NEXT_COMMAND <= FETCH1;
                end
            MVACR1: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= AC;
                    ALU_OP <= ADDAB;
                    SELECTORS <= 13'b0_0000_0010_0000;
                    NEXT_COMMAND <= FETCH1;
                end
            MVACR2: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= AC;
                    ALU_OP <= ADDAB;
                    SELECTORS <= 13'b0_0000_0001_0000;
                    NEXT_COMMAND <= FETCH1;
                end
            MVACTR: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= AC;
                    ALU_OP <= ADDAB;
                    SELECTORS <= 13'b0_0000_0000_1000;
                    NEXT_COMMAND <= FETCH1;
                end
            MVACAR: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= AC;
                    ALU_OP <= ADDAB;
                    SELECTORS <= 13'b0_0000_1000_0000;
                    NEXT_COMMAND <= FETCH1;
                end
            MVR: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= R;
                    ALU_OP <= PASS;
                    SELECTORS <= 13'b0_0000_0000_0010;
                    NEXT_COMMAND <= FETCH1;
                end
            MVR1: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= R1;
                    ALU_OP <= PASS;
                    SELECTORS <= 13'b0_0000_0000_0010;
                    NEXT_COMMAND <= FETCH1;
                end
            MVR2: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= R2;
                    ALU_OP <= PASS;
                    SELECTORS <= 13'b0_0000_0000_0010;
                    NEXT_COMMAND <= FETCH1;
                end
            MVTR: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= TR;
                    ALU_OP <= PASS;
                    SELECTORS <= 13'b0_0000_0000_0010;
                    NEXT_COMMAND <= FETCH1;
                end
            MVAR: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= AR;
                    ALU_OP <= PASS;
                    SELECTORS <= 13'b0_0000_0000_0010;
                    NEXT_COMMAND <= FETCH1;
                end
            INCAR: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= DATA_FROM_RAM;
                    ALU_OP <= ADDAB;
                    SELECTORS <= 13'b0_0001_0000_0000;
                    NEXT_COMMAND <= FETCH1;
                end
            INCR1: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= DATA_FROM_RAM;
                    ALU_OP <= ADDAB;
                    SELECTORS <= 13'b0_1000_0000_0000;
                    NEXT_COMMAND <= FETCH1;
                end
            INCR2: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= DATA_FROM_RAM;
                    ALU_OP <= ADDAB;
                    SELECTORS <= 13'b0_0100_0000_0000;
                    NEXT_COMMAND <= FETCH1;
                end
            ADD: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= R;
                    ALU_OP <= ADDAB;
                    SELECTORS <= 13'b0_0000_0000_0010;
                    NEXT_COMMAND <= FETCH1;
                end
            SUB: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= R;
                    ALU_OP <= SUBAB;
                    SELECTORS <= 13'b0_0000_0000_0010;
                    NEXT_COMMAND <= FETCH1;
                end
            MUL4: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= DATA_FROM_RAM;
                    ALU_OP <= MUL4A;
                    SELECTORS <= 13'b0_0000_0000_0010;
                    NEXT_COMMAND <= FETCH1;
                end
            DIV2: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= DATA_FROM_RAM;
                    ALU_OP <= DIV2A;
                    SELECTORS <= 13'b0_0000_0000_0010;
                    NEXT_COMMAND <= FETCH1;
                end
            ADDM: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= INSTRUCTIONS;
                    ALU_OP <= ADDAB;
                    SELECTORS <= 13'b1_0000_0000_0000;
                    NEXT_COMMAND <= ADDM1;
                end
            ADDM1: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= INSTRUCTIONS;
                    ALU_OP <= ADDAB;
                    SELECTORS <= 13'b0_0000_0000_0010;
                    NEXT_COMMAND <= FETCH1;
                end
            JPNZ: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= DATA_FROM_RAM;
                    ALU_OP <= PASS;
                    SELECTORS <= 13'b0_0000_0000_0000;
                    NEXT_COMMAND <= (FLAG_Z) ? JPNZY : JPNZN;
                end
            JPNZY: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= DATA_FROM_RAM;
                    ALU_OP <= PASS;
                    SELECTORS <= 13'b1_0000_0000_0000;
                    NEXT_COMMAND <= JPNZY1;
                end
            JPNZY1: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= DATA_FROM_RAM;
                    ALU_OP <= PASS;
                    SELECTORS <= 13'b0_0000_0000_0000;
                    NEXT_COMMAND <= FETCH1;
                end
            JPNZN: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= INSTRUCTIONS;
                    ALU_OP <= ADDAB;
                    SELECTORS <= 13'b0_0000_0000_0000;
                    NEXT_COMMAND <= JPNZN1;
                end
            JPNZN1: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= INSTRUCTIONS;
                    ALU_OP <= PASS;
                    //SELECTORS <= 13'b0_0000_0000_0010;
                    SELECTORS <= 13'b0_0000_0100_0000;
                    NEXT_COMMAND <= JPNZN2;
                end
            JPNZN2: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= AC;
                    ALU_OP <= ADDAB;
                    //SELECTORS <= 13'b0_0000_0100_0000;
                    SELECTORS <= 13'b0_0000_0000_0010;
                    NEXT_COMMAND <= FETCH1;
                end
            NOP: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 0;
                    REG_IN_B_BUS <= DATA_FROM_RAM;
                    ALU_OP <= ADDAB;
                    SELECTORS <= 13'b0_0000_0000_0000;
                    NEXT_COMMAND <= FETCH1;
                end
            END: // Checked
                begin
                    FETCH <= 0;
                    FINISH <= 1;
                    REG_IN_B_BUS <= DATA_FROM_RAM;
                    ALU_OP <= ADDAB;
                    SELECTORS <= 13'b0_0000_0000_0000;
                    NEXT_COMMAND <= END;
                    status <= 1'b1;
                end
        endcase
    assign CMD = CONTROL_COMMAND;
endmodule