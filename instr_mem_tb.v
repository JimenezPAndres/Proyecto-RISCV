`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2024 21:32:00
// Design Name: 
// Module Name: instr_mem_tb
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


module instr_mem_tb;

 
    
    reg [0:47] pc;
    wire [31:0]instr;

    instr_mem d(instr,pc);  // 

    initial begin
        // Stimulus generation
	
	pc = 0;
	
	#50 pc = 4;
      
    end

    // Monitor the output

        
endmodule