`timescale 1ns / 100ps
/////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2022 06:51:27 PM
// Design Name: 
// Module Name: processor_tb
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
module processor_tb;
    reg MAIN_CLOCK;
    wire PROCESS_DONE;
    wire [15:0] CURRENTADDRESS, REG_AC, REG_1, REG_2;
    wire [5:0] CMD;
    wire [7:0] INSTRUCTIONADDRESS, CURRENTINSTRUCTION,OUTPUT_FROM_RAM;
    reg [15:0] ADD_FROM_OUT;
    wire [7:0] DATA_TO_OUT;
    integer file,i;
    PROCESSOR UUT (
        .MAIN_CLOCK(MAIN_CLOCK),
        .CURRENTADDRESS(CURRENTADDRESS),
        .REG_AC(REG_AC),
        .REG_1(REG_1),
        .REG_2(REG_2),
        .OUTPUT_FROM_RAM(OUTPUT_FROM_RAM),
        .INSTRUCTIONADDRESS(INSTRUCTIONADDRESS),
        .CURRENTINSTRUCTION(CURRENTINSTRUCTION),
        .CMD(CMD),
        .PROCESS_DONE(PROCESS_DONE),
         .ex_dataout(DATA_TO_OUT),
         .ex_address(ADD_FROM_OUT)
    );
// Clock
    always
        #10 MAIN_CLOCK = ~MAIN_CLOCK;
    initial begin
        MAIN_CLOCK = 1'b0;
        #100000000
        file=$fopen("C:\\Users\\hirun\\CSD 3\\output_nwu.txt","w");
        for (i=2; i< 65539; i=i+4)
            begin 
                @(posedge MAIN_CLOCK)
                ADD_FROM_OUT = i;
                $fwrite(file,"%b",DATA_TO_OUT);
                $fwrite(file,"\n");
            end
      $fclose(file);
      $finish;
  end
    

endmodule