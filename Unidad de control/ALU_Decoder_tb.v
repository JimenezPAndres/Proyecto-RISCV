`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2024 02:36:34 PM
// Design Name: 
// Module Name: ALU_Decoder_tb
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


module ALU_Decoder_tb (
    );
// Inputs
reg ALUD;
reg [2:0] F;

// Outputs
wire [1:0] ALUOp;

ALU_Decoder prueba (
.ALUD(ALUD), 
.F(F), 
.ALUOp(ALUOp)
);

initial begin
ALUD = 0;
F = 3'b000;

// Reset
#10;
        
// Prueba de casos
//ALUD = 0; F = 3'b000; #10; // Expect ALUOp = 00 (ADD)
//ALUD = 0; F = 3'b001; #10; // Expect ALUOp = 00 (ADD)
//ALUD = 0; F = 3'b010; #10; // Expect ALUOp = 00 (ADD)
//ALUD = 0; F = 3'b011; #10; // Expect ALUOp = 00 (ADD)
//ALUD = 0; F = 3'b100; #10; // Expect ALUOp = 00 (ADD)
//ALUD = 0; F = 3'b101; #10; // Expect ALUOp = 00 (ADD)
//ALUD = 0; F = 3'b110; #10; // Expect ALUOp = 00 (ADD)
//ALUD = 0; F = 3'b111; #10; // Expect ALUOp = 00 (ADD)

ALUD = 1; F = 3'b000; #10; // Expect ALUOp = 00 (ADD)
ALUD = 1; F = 3'b001; #10; // Expect ALUOp = 01 (XOR)
ALUD = 1; F = 3'b010; #10; // Expect ALUOp = 10 (AND)
ALUD = 1; F = 3'b011; #10; // Expect ALUOp = 11 (SRA)
ALUD = 1; F = 3'b100; #10; // Expect ALUOp = 00 (ADD)
ALUD = 1; F = 3'b101; #10; // Expect ALUOp = 01 (XOR)
ALUD = 1; F = 3'b110; #10; // Expect ALUOp = 10 (AND)
ALUD = 1; F = 3'b111; #10; // Expect ALUOp = 11 (SRA)

end
endmodule