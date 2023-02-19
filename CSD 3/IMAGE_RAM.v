`timescale 1 ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2022 05:34:00 PM
// Design Name: 
// Module Name: IMAGE_RAM
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


module IMAGE_RAM(
    address,
	clock,
	data,
	wren,
	//TRANSMITTED_8_BITS,
	dataout,
	ex_address,
    ex_dataout
    );

	input	[15:0]  address;
	input	  clock;
	input	[7:0]  data;
	input	  wren=1;
	input [15:0] ex_address;
	output reg [7:0] ex_dataout;
	
	output reg [7:0]  dataout;  
    reg[7:0] MEMORY [65535:0];
    initial begin
        //    MEMORY[0] = 8'b00000100;  
        $readmemb("C:\\Users\\hirun\\CSD 3\\nwu.txt",MEMORY);
    end
    always @ (ex_address) 
    begin
        ex_dataout <= MEMORY[ex_address];
    end 
    always @ (posedge clock)
    begin
        if(wren == 1)begin
            MEMORY[address] <= data[7:0];
        end
        else begin
            dataout <= MEMORY[address];
        end
    end
endmodule
