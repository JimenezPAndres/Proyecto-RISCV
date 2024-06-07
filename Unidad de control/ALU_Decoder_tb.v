//Objetivos:
//el objetivo de la prueba es verificar que el módulo ALU_Decoder genere correctamente la señal 
//de salida ALUOp para diversas combinaciones de las señales de entrada ALUD y F. Esta señal de 
//salida indica la operación que debe realizar la ALU, basándose en la lógica de decodificación 
//implementada en el módulo.
//Los resultados esperados se indican a la par de cada prueba
//Estímulos:
//Se inicializa todo en 0, y se esperan 10 unidades de tiempo.
//Se realizan 8 casos distintos y se espera 10 unidades de tiempo entre cada uno.




`timescale 1ns / 1ps

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
ALUD = 0; F = 3'b000; #10; // Expect ALUOp = 00 (ADD)
ALUD = 0; F = 3'b100; #10; // Expect ALUOp = 00 (ADD)
ALUD = 0; F = 3'b101; #10; // Expect ALUOp = 00 (ADD)
ALUD = 0; F = 3'b111; #10; // Expect ALUOp = 00 (ADD)

ALUD = 1; F = 3'b000; #10; // Expect ALUOp = 00 (ADD)
ALUD = 1; F = 3'b100; #10; // Expect ALUOp = 01 (XOR)
ALUD = 1; F = 3'b101; #10; // Expect ALUOp = 11 (SRA)
ALUD = 1; F = 3'b111; #10; // Expect ALUOp = 10 (AND)

end
endmodule
