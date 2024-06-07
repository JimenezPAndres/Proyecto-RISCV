//El objetivo de la prueba es verificar el correcto funcionamiento del módulo mux_Jalr bajo 
//diferentes condiciones de entrada. El archivo de testbench proporcionado define los estímulos
//que se aplicarán al módulo bajo prueba (UUT) y espera observar los resultados esperados en 
//la salida out_mux_JALR.

`timescale 1ns / 1ps

module mux_Jalr_tb;

    reg [31:0] PC;
    reg [31:0] RS2;
    reg Jalr;
    wire [31:0] out_mux_JALR;
    
    // Instancia del módulo bajo prueba
    mux_Jalr UUT (
        .PC(PC),
        .RS2(RS2),
        .Jalr(Jalr),
        .out_mux_JALR(out_mux_JALR)
    );
    
    initial begin   
        // Establecer señales iniciales y generar estímulos de prueba
        PC = 32'h00000000; 
        RS2 = 32'h7FFFFFFF; 
        Jalr = 1;
        #10;
        
        PC = 32'h12345678; 
        RS2 = 32'hFFFFFFFF; 
        Jalr = 0;
        #10;
        
        PC = 32'hAAAAAAAA; 
        RS2 = 32'h55555555; 
        Jalr = 1;
        #10;

        PC = 32'h0000FFFF; 
        RS2 = 32'hFFFF0000; 
        Jalr = 0;
        #10;
        
        // Fin de la simulación
        $finish;
    end

endmodule
