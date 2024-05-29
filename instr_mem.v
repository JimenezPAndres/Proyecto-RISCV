`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2024 21:30:30
// Design Name: 
// Module Name: instr_mem
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


module instr_mem(output_memory,pc);
   
    // entradas y salidas
 
    output reg [31:0] output_memory; // memoria de salida
    input wire [0:47] pc;
    
     // Memoria 
    reg [31:0] memory [0:47];
    
    // funcion de uso para controlar address
    // depende de los valores de pc
    
    initial begin
        $readmemh("mem.mem",memory,0,47);
    end
    
    always@* begin
    output_memory <= memory[pc];
    end
    

 endmodule
 
 
