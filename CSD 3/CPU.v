//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2022 04:13:42 PM
// Design Name: 
// Module Name: CPU
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


module CPU
(
    // Inputs
    input MAIN_CLOCK,
    input [7:0] DATA_FROM_RAM, INSTRUCTION,
    output wire status,
    // Outputs
    output PROCESS_FINISHED, CPU_CLOCK,
    output CPU_WRITE_EN, Z_Flag,
    output [15:0] CPU_ADDRESS, REG_AC, REG_1, REG_2,
    output [7:0] CPU_DATA, INSTRUCTION_ADDRESS,
    output [5:0] CMD
);
    
    wire INTERNAL_CLOCK, FLAG_Z, FETCH;
    wire [2:0] ALU_OP;
    wire [3:0] REG_IN_B_BUS;
    wire [7:0] IR;
    wire [15:0] B_BUS, PC, R1, R2, TR, R, AC, ALU_OUT;
    wire [12:0] SELECTORS;
    wire SIGNAL_TO_FINISH_PROCESS;

    assign CPU_CLOCK = INTERNAL_CLOCK;
    assign CPU_WRITE_EN = SELECTORS[0];
    assign CPU_DATA = B_BUS[7:0];
    assign INSTRUCTION_ADDRESS = PC[7:0];
    assign PROCESS_FINISHED = SIGNAL_TO_FINISH_PROCESS;
    assign REG_AC = AC;
    assign REG_1 = R1;
    assign REG_2 = R2;
    //assign Z_Flag = FLAG_Z;

    CPU_CLOCK_GENERATOR Clock (
        .MAIN_CLOCK(MAIN_CLOCK),
        .PROCESS_FINISHED(SIGNAL_TO_FINISH_PROCESS),
        .TICK(INTERNAL_CLOCK)
    );
    MUX_FOR_BUS_B Muxer (
        .SELECT(REG_IN_B_BUS),
        .PC(PC),
        .R1(R1),
        .R2(R2),
        .TR(TR),
        .R(R),
        .AC(AC),
        .AR(CPU_ADDRESS),
        .INSTRUCTIONS(INSTRUCTION),
        .DATA_FROM_RAM(DATA_FROM_RAM),
        .BUS(B_BUS)
    );
    CONTROL_UNIT CUnit (
        .CLOCK(INTERNAL_CLOCK),
        .FLAG_Z(FLAG_Z),
        .INSTRUCTION(IR),
        .FETCH(FETCH),
        .FINISH(SIGNAL_TO_FINISH_PROCESS),
        .REG_IN_B_BUS(REG_IN_B_BUS),
        .ALU_OP(ALU_OP),
        .CMD(CMD),
        .SELECTORS(SELECTORS),
        .status(status)
    );
    REGISTER #(8) INSTRUCTION_REGISTER (
        .CLOCK(INTERNAL_CLOCK),
        .LOAD(FETCH),
        .INCREMENT(1'b0),
        .DATA(B_BUS[7:0]),
        .OUT(IR)
    );
    REGISTER #(16) REGISTER_AR (
        .CLOCK(INTERNAL_CLOCK),
        .LOAD(SELECTORS[7]),
        .INCREMENT(SELECTORS[8]),
        .DATA(B_BUS),
        .OUT(CPU_ADDRESS)
    );
    REGISTER #(16) GENERAL_REGISTER (
        .CLOCK(INTERNAL_CLOCK),
        .LOAD(SELECTORS[2]),
        .INCREMENT(1'b0),
        .DATA(B_BUS),
        .OUT(R)
    );
    REGISTER #(16) REGISTER_01 (
        .CLOCK(INTERNAL_CLOCK),
        .LOAD(SELECTORS[5]),
        .INCREMENT(SELECTORS[11]),
        .DATA(B_BUS),
        .OUT(R1)
    );
    REGISTER #(16) REGISTER_02 (
        .CLOCK(INTERNAL_CLOCK),
        .LOAD(SELECTORS[4]),
        .INCREMENT(SELECTORS[10]),
        .DATA(B_BUS),
        .OUT(R2)
    );
    REGISTER #(16) REGISTER_TR (
        .CLOCK(INTERNAL_CLOCK),
        .LOAD(SELECTORS[3]),
        .INCREMENT(SELECTORS[9]),
        .DATA(B_BUS),
        .OUT(TR)
    );
    REGISTER #(16) REGISTER_AC (
        .CLOCK(INTERNAL_CLOCK),
        .LOAD(SELECTORS[1]),
        .INCREMENT(1'b0),
        .DATA(ALU_OUT),
        .OUT(AC)
    );
    REGISTER #(16) PROGRAM_COUNTER (
        .CLOCK(INTERNAL_CLOCK),
        .LOAD(SELECTORS[6]),
        .INCREMENT(SELECTORS[12]),
        .DATA(B_BUS),
        .OUT(PC)
    );
    ALU ALUnit (
        .A_bus(AC),
        .B_bus(B_BUS),
        .ALU_OP(ALU_OP),
        .C_bus(ALU_OUT),
        .FLAG_Z(FLAG_Z)
    );

endmodule
