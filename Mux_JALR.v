//Funionabilidad:
//El módulo mux_Jalr es un multiplexor (MUX) de 2 a 1 que selecciona entre dos entradas de 32 bits (PC y RS2) basándose en la 
//señal de control Jalr. La salida out_mux_JALR será igual a PC si Jalr es 1, de lo contrario, será igual a RS2.Este comportamiento 
//es esencial para determinar el valor que se utilizará en operaciones relacionadas con el salto y enlace (JALR).
//Entradas:
//PC (input [31:0]): Entrada de 32 bits que representa el valor del contador de programa (Program Counter), usado típicamente 
//en operaciones de salto.
//RS2 (input [31:0]): Entrada de 32 bits que representa el valor del segundo registro fuente.
//Jalr (input): Señal de control que determina la fuente de datos. Si Jalr es 1, se selecciona PC; si es 0, se selecciona RS2.
//Salidas:
//out_mux_JALR (output [31:0]): Salida de 32 bits que proporciona el valor seleccionado por el multiplexor.
//Razón de implementación:
//El módulo mux_Jalr se introduce para permitir la selección dinámica entre el contador de programa (PC) y un valor de registro (RS2) 
//en el camino de datos del procesador. Esta selección es crucial para la correcta ejecución de instrucciones de salto y enlace (JALR). 


module mux_Jalr(
    input [31:0] PC,
    input [31:0] RS2,
    input Jalr, /señal de control
    output [31:0] out_mux_JALR
);

    assign out_mux_JALR = (Jalr) ?  PC: RS2; //Si Jalr es 1 se selecciona PC

endmodule
