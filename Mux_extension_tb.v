`timescale 1ns / 1ps

module mux_extension_tb;

    reg [31:0] extension_signo;
    reg [31:0] RS1;
    reg ALUSrc;
    wire [31:0] out_mux_exte;
    
    // Instancia del módulo bajo prueba
    mux_extension UUT (
        .extension_signo(extension_signo),
        .RS1(RS1),
        .ALUSrc(ALUSrc),
        .out_mux_exte(out_mux_exte)
    );
    
    initial begin   
        // Establecer señales iniciales y generar estímulos de prueba
        extension_signo = 32'h00000000; 
        RS1 = 32'h7FFFFFFF; 
        ALUSrc = 1;
        #10;
        
        extension_signo = 32'hFFFFFFFF; 
        RS1 = 32'h12345678; 
        ALUSrc = 0;
        #10;
        
        extension_signo = 32'hAAAAAAAA; 
        RS1 = 32'h55555555; 
        ALUSrc = 1;
        #10;

        extension_signo = 32'h0000FFFF; 
        RS1 = 32'hFFFF0000; 
        ALUSrc = 0;
        #10;
        
        // Fin de la simulación
        $finish;
    end

endmodule