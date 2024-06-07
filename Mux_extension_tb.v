//el objetivo es comprobar que la salida out_mux_exte refleja correctamente las entradas extension_signo y 
//RS1 según el valor de la señal de control ALUSrc.
//Se tienen 4 estímulos, con un tiempo de aplicación de 10 ns
//Resultados esperados:
//Si ALUSrc = 1, entonces out_mux_exte = extension_signo.
//Si ALUSrc = 0, entonces out_mux_exte = RS1.

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
        //Salida esperada: debería ser igual a extension_signo, es decir, 32'h00000000
        
        extension_signo = 32'hFFFFFFFF; 
        RS1 = 32'h12345678; 
        ALUSrc = 0;
        #10;
        //Salida esperada: debería ser igual a RS1, es decir, 32'h12345678
        
        extension_signo = 32'hAAAAAAAA; 
        RS1 = 32'h55555555; 
        ALUSrc = 1;
        #10;
        //Salida esperada: debería ser igual a extension_signo, es decir, 32'hAAAAAAAA

        extension_signo = 32'h0000FFFF; 
        RS1 = 32'hFFFF0000; 
        ALUSrc = 0;
        #10;
        //Salida esperada: debería ser igual a RS1, es decir, 32'hFFFF0000
        
        // Fin de la simulación
        $finish;
    end

endmodule
