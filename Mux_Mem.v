`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2024 09:31:37 AM
// Design Name: 
// Module Name: Mux_Mem
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


module Mux_Mem(

    input [31:0] ALU,
    input [31:0] MEmoria,
    input MemtoReg,
    output out_mux_mem
);

assign out_mux_exte = (ALUSrc) ?  Memoria: ALU;



endmodule
