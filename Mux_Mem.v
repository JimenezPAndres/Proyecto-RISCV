//Funcionabilidad:
//El módulo Mux_Mem es un multiplexor (MUX) de 2 a 1 que selecciona entre dos entradas de 32 bits (ALU y Memoria) basándose en la 
//señal de control MemtoReg. La salida out_mux_mem será igual a Memoria si MemtoReg es 1, de lo contrario, será igual a ALU. 
//Este comportamiento es esencial para determinar la fuente del valor que se escribirá en un registro, permitiendo elegir entre 
//el resultado de la ALU y un valor leído de memoria.
//Entradas:
//ALU (input [31:0]): Entrada de 32 bits que representa el valor de salida de la Unidad Aritmético-Lógica (ALU).
//Memoria (input [31:0]): Entrada de 32 bits que representa el valor leído de la memoria.
//MemtoReg (input): Señal de control que determina la fuente de datos. Si MemtoReg es 1, se selecciona Memoria; si es 0, se 
//selecciona ALU.
//Salidas:
//out_mux_mem (output [31:0]): Salida de 32 bits que proporciona el valor seleccionado por el multiplexor.
//Razón de implemetación:
//El módulo Mux_Mem se introduce para permitir la selección dinámica entre el resultado de la ALU y un valor de memoria en 
//el camino de datos del procesador. Esta selección es crucial para la correcta ejecución de instrucciones de carga y operaciones
//aritméticas.


`timescale 1ns / 1ps

module Mux_Mem(

    input [31:0] ALU,
    input [31:0] Memoria,
    input MemtoReg, //señal de control
    output [31:0] out_mux_mem
);
    assign out_mux_mem = (MemtoReg) ?  Memoria: ALU; //si MemtoReg es 1 sale Memoria.
endmodule
