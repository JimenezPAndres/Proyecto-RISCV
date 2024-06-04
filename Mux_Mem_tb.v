`timescale 1ns / 1ps

module Mux_Mem_tb;

    reg [31:0] ALU;
    reg [31:0] Memoria;
    reg MemtoReg;
    wire [31:0] out_mux_mem;
    
    // Instancia del m—dulo bajo prueba
    Mux_Mem UUT (
        .ALU(ALU),
        .Memoria(Memoria),
        .MemtoReg(MemtoReg),
        .out_mux_mem(out_mux_mem)
    );
    
    initial begin   
        // Establecer se–ales iniciales y generar est’mulos de prueba
        ALU = 32'h00000000; 
        Memoria = 32'h7FFFFFFF; 
        MemtoReg = 1;
        #10;
        
        ALU = 32'h12345678; 
        Memoria = 32'hFFFFFFFF; 
        MemtoReg = 0;
        #10;
        
        ALU = 32'hAAAAAAAA; 
        Memoria = 32'h55555555; 
        MemtoReg = 1;
        #10;

        ALU = 32'h0000FFFF; 
        Memoria = 32'hFFFF0000; 
        MemtoReg = 0;
        #10;
        
        // Fin de la simulaci—n
        $finish;
    end

endmodule