
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2024 03:24:50 PM
// Design Name: 
// Module Name: Main_Decoder_tb
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


module Main_Decoder_tb(
    );
// Inputs
reg [5:0] op;
reg [2:0] F;

// Outputs
wire ALUD;
wire RegW;
wire ALUSrc;
wire MemW;
wire Jalr;

Main_Decoder prueba (
.ALUD(ALUD), 
.F(F), 
.op(op),
.RegW(RegW),
.ALUSrc(ALUSrc),
.MemW(MemW),
.Jalr(Jalr)
);

initial begin
// Initialize Inputs
op = 6'b000000;
F = 3'b000;

// Wait for global reset
#10;
// Prueba de casos
op = 6'b100011; F = 3'b010; #10; // Expect ALUD = 0  RegW = 0 ALUSrc = 1   MemW = 1  Jalr=0
op = 6'b011011; F = 3'b111; #10; // Expect ALUD = 0  RegW = 1 ALUSrc = 1   MemW = 0  Jalr=1
op = 6'b001011; F = 3'bZZZ; #10; // Expect ALUD = 0  RegW = 1 ALUSrc = 1   MemW = 0  Jalr=0
op = 6'b110011; F = 3'b010; #10; // Expect ALUD = 1  RegW = 1 ALUSrc = 0   MemW = 0  Jalr=0
op = 6'b010011; F = 3'bZZZ; #10; // Expect ALUD = 0  RegW = 1 ALUSrc = 1   MemW = 0  Jalr=0
op = 6'b110011; F = 3'b000; #10; // Expect ALUD = 1  RegW = 1 ALUSrc = 0   MemW = 0  Jalr=0
end       
endmodule
