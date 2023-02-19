`timescale 1 ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2022 04:25:15 PM
// Design Name: 
// Module Name: INSTRUCTION_ROM
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


module INSTRUCTION_ROM(
    input clock,
    input [7:0] address,
    output reg [7:0] q
);

    reg[7:0] memory[0:255];
    //assign q=mem[address];


always @(posedge clock)
	q<=memory[address];

//initial $readmemh("INSTRUCTIONS.mif", mem);
	
//initial begin
	//$readmemh("INSTRUCTIONS.mif", mem, 0, 255);	
//end

    initial begin
        memory[0]=8'b0000_0110;
        memory[1]=8'b0000_1011;
        memory[2]=8'b0000_1100;
        memory[3]=8'b0001_0001;
        memory[4]=8'b0001_1101;
        memory[5]=8'b0001_1101;
        memory[6]=8'b0001_1101;
        memory[7]=8'b0001_1101;
        memory[8]=8'b0000_1010;
        memory[9]=8'b0001_0000;
        memory[10]=8'b0001_1011;
        memory[11]=8'b0000_1110;
        memory[12]=8'b0000_0111;
        memory[13]=8'b0000_1010;
        memory[14]=8'b0001_0011;
        memory[15]=8'b0000_0111;
        memory[16]=8'b0001_1101;
        memory[17]=8'b0001_1110;
        memory[18]=8'b0001_1011;
        memory[19]=8'b0000_1010;
        memory[20]=8'b0001_0011;
        memory[21]=8'b0000_0111;
        memory[22]=8'b0001_1011;
        memory[23]=8'b0000_1010;
        memory[24]=8'b0010_0001;
        memory[25]=8'b0001_1111;
        memory[26]=8'b1111_1110;
        memory[27]=8'b0000_1110;
        memory[28]=8'b0000_0111;
        memory[29]=8'b0001_1101;
        memory[30]=8'b0001_1110;
        memory[31]=8'b0001_1011;
        memory[32]=8'b0000_1010;
        memory[33]=8'b0001_0011;
        memory[34]=8'b0010_0001;
        memory[35]=8'b0000_1101;
        memory[36]=8'b0000_0111;
        memory[37]=8'b0001_1101;
        memory[38]=8'b0001_1011;
        memory[39]=8'b0000_1010;
        memory[40]=8'b0001_0011;
        memory[41]=8'b0000_0111;
        memory[42]=8'b0001_1101;
        memory[43]=8'b0001_1110;
        memory[44]=8'b0001_1011;
        memory[45]=8'b0000_1010;
        memory[46]=8'b0010_0001;
        memory[47]=8'b0001_1111;
        memory[48]=8'b1111_1110;
        memory[49]=8'b0000_1110;
        memory[50]=8'b0000_0111;
        memory[51]=8'b0001_1011;
        memory[52]=8'b0000_1010;
        memory[53]=8'b0001_0011;
        memory[54]=8'b0000_0111;
        memory[55]=8'b0001_1101;
        memory[56]=8'b0001_1110;
        memory[57]=8'b0001_1011;
        memory[58]=8'b0000_1010;
        memory[59]=8'b0001_0011;
        memory[60]=8'b0000_0111;
        memory[61]=8'b0001_1011;
        memory[62]=8'b0001_1110;
        memory[63]=8'b0001_1110;
        memory[64]=8'b0001_1110;
        memory[65]=8'b0001_1110;
        memory[66]=8'b0000_1010;
        memory[67]=8'b0001_0010;
        memory[68]=8'b0000_1110;
        memory[69]=8'b0000_1111;
        memory[70]=8'b0000_1000;
        memory[71]=8'b0001_0100;
        memory[72]=8'b0001_0000;
        memory[73]=8'b0000_1010;
        memory[74]=8'b0000_0110;
        memory[75]=8'b0001_1111;
        memory[76]=8'b1111_1110;
        memory[77]=8'b0001_1100;
        memory[78]=8'b0001_0110;
        memory[79]=8'b0000_0011;
        memory[80]=8'b0000_1011;
        memory[81]=8'b0001_0100;
        memory[82]=8'b0001_0001;
        memory[83]=8'b0000_1010;
        memory[84]=8'b0000_0110;
        memory[85]=8'b0001_1111;
        memory[86]=8'b1111_1110;
        memory[87]=8'b0001_1100;
        memory[88]=8'b0001_0110;
        memory[89]=8'b0000_0011;
        memory[90]=8'b0000_0110;
        memory[91]=8'b0000_1011;
        memory[92]=8'b0000_1100;
        memory[93]=8'b0001_0001;
        memory[94]=8'b0001_1101;
        memory[95]=8'b0001_1101;
        memory[96]=8'b0001_1101;
        memory[97]=8'b0001_1101;
        memory[98]=8'b0000_1010;
        memory[99]=8'b0001_0000;
        memory[100]=8'b0001_1011;
        memory[101]=8'b0000_1110;
        memory[102]=8'b0001_1110;
        memory[103]=8'b0000_1101;
        memory[104]=8'b0000_0111;
        memory[105]=8'b0000_1010;
        memory[106]=8'b0001_0011;
        memory[107]=8'b0000_0111;
        memory[108]=8'b0001_1011;
        memory[109]=8'b0000_1010;
        memory[110]=8'b0010_0001;
        memory[111]=8'b0001_1111;
        memory[112]=8'b1111_1111;
        memory[113]=8'b0000_1110;
        memory[114]=8'b0000_0111;
        memory[115]=8'b0001_1011;
        memory[116]=8'b0000_1010;
        memory[117]=8'b0001_0011;
        memory[118]=8'b0000_0111;
        memory[119]=8'b0001_1011;
        memory[120]=8'b0001_1110;
        memory[121]=8'b0001_1110;
        memory[122]=8'b0000_1010;
        memory[123]=8'b0001_0010;
        memory[124]=8'b0000_1110;
        memory[125]=8'b0000_1111;
        memory[126]=8'b0000_1000;
        memory[127]=8'b0001_0100;
        memory[128]=8'b0001_0100;
        memory[129]=8'b0001_0000;
        memory[130]=8'b0000_1010;
        memory[131]=8'b0000_0110;
        memory[132]=8'b0001_1111;
        memory[133]=8'b1111_1111;
        memory[134]=8'b0001_1111;
        memory[135]=8'b0000_0001;
        memory[136]=8'b0001_1100;
        memory[137]=8'b0001_0110;
        memory[138]=8'b0101_1101;
        memory[139]=8'b0000_1011;
        memory[140]=8'b0001_0101;
        memory[141]=8'b0001_0101;
        memory[142]=8'b0001_0001;
        memory[143]=8'b0000_1010;
        memory[144]=8'b0000_0110;
        memory[145]=8'b0001_1111;
        memory[146]=8'b1111_1111;
        memory[147]=8'b0001_1111;
        memory[148]=8'b0000_0001;
        memory[149]=8'b0001_1100;
        memory[150]=8'b0001_0110;
        memory[151]=8'b0101_1101;
        memory[152]=8'b0010_0000;
        //memory[153:255]=8'b0000_0000;
    end

endmodule


