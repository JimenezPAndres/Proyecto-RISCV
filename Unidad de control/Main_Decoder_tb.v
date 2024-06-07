//Objetivo de la prueba:
//El objetivo de la prueba es verificar que el módulo Main_Decoder genere las señales de 
//control correctas para diferentes combinaciones de códigos de operación (op) y funciones (F). 
//Estas señales de control son cruciales para el funcionamiento adecuado del procesador, ya que 
//determinan cómo deben comportarse otros componentes del sistema en respuesta a las instrucciones
//decodificadas.
//Los resultados esperados se comentan al lado de cada prueba realizada. 
//Estimulos:
//Se van a inicializar las entradas (op y F) en 0, y se esperan 10 unidades de tiempo
//Luego se prueban 7 casos diferentes para los cuales se esperan 10 unidades de tiempo entre ellos.
//Cada conjunto de valores de op y F se mantiene durante 10 unidades de tiempo para permitir la 
//actualización y estabilización de las señales de salida.


`timescale 1ns / 1ps

//Testbench para verificar el comportamiento de las senales de control de la UC

module Main_Decoder_tb(
    );
// Inputs
reg [6:0] op;
reg [2:0] F;

// Outputs
wire ALUD; // ALUDecoder
wire RegW; // escribir en registro 
wire ALUSrc; // escoge entre reg e inmediato
wire MemW; // escribir en memoria
wire Jalr; //identificar JAL
wire PCSrc; // mux PC
wire Memtoreg; // leer de memoria

Main_Decoder prueba (
.ALUD(ALUD), 
.F(F), 
.op(op),
.RegW(RegW),
.ALUSrc(ALUSrc),
.MemW(MemW),
.Jalr(Jalr),
.PCSrc(PCSrc),
.Memtoreg(Memtoreg)
);

initial begin
// inicializar opcode y function
op = 7'b000000;
F = 3'b000;

// 
#10;

// Prueba de casos
op = 7'b0110011; F = 3'b111; #10; //  ALUD = 0  RegW = 0 ALUSrc = 1   MemW = 1  Jalr=0 PCSrc = 0  Memtoreg=0
op = 7'b0000011; F = 3'b010; #10; //  ALUD = 0  RegW = 1 ALUSrc = 1   MemW = 0  Jalr=1 PCSrc = 1  Memtoreg=1
op = 7'b0010011; F = 3'b000; #10; //  ALUD = 0  RegW = 1 ALUSrc = 1   MemW = 0  Jalr=0 PCSrc = 0  Memtoreg=0
op = 7'b1100111; F = 3'b000; #10; //  ALUD = 1  RegW = 1 ALUSrc = 0   MemW = 0  Jalr=0 PCSrc = 0  Memtoreg=0
op = 7'b0100011; F = 3'b010; #10; //  ALUD = 0  RegW = 1 ALUSrc = 1   MemW = 0  Jalr=0 PCSrc = 1  Memtoreg=0
op = 7'b0110111; F = 3'b111; #10; //  ALUD = 0  RegW = 1 ALUSrc = 1   MemW = 0  Jalr=0 PCSrc = 0  Memtoreg=0
op = 7'b1101111; F = 3'b000; #10; //  ALUD = 1  RegW = 1 ALUSrc = 0   MemW = 0  Jalr=0 PCSrc = 0  Memtoreg=0
end       
endmodule
