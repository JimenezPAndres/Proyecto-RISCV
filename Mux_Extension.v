//Funcionalidad:
//El módulo mux_extension es un multiplexor (MUX) de 2 a 1 que selecciona entre dos entradas de 32 bits (extension_signo y RS1) 
//basándose en la señal de control ALUSrc. La salida out_mux_exte será igual a extension_signo si ALUSrc es 1, de lo contrario, 
//será igual a RS1. Este comportamiento es esencial en procesadorespara determinar si el valor de una operación de la ALU debe
//venir de un registro o de una constante extendida por signo.
//Entradas:
//extension_signo (input [31:0]): Entrada de 32 bits que representa una constante extendida por signo, típicamente utilizada 
//en operaciones inmediatas.
//RS1 (input [31:0]): Entrada de 32 bits que representa el valor del primer operando de un registro.
//ALUSrc (input): Señal de control que determina la fuente de datos. Si ALUSrc es 1, se selecciona extension_signo; si es 0, 
//se selecciona RS1.
//Salidas:
//out_mux_exte (output [31:0]): Salida de 32 bits que proporciona el valor seleccionado por el multiplexor.
//Razón de Implementación:
//El módulo mux_extension se introduce para permitir la selección dinámica entre una constante extendida por signo y un valor 
//de registro en el camino de datos del procesador para sí tener una de las entradas de la ALU principal.



module mux_extension(
    input [31:0] extension_signo,
    input [31:0] RS1,
    input ALUSrc, //señal de control
    output [31:0] out_mux_exte
);

    assign out_mux_exte = (ALUSrc) ?  extension_signo: RS1; //Si ALUSrc es 1 se selecciona extensión de signo

endmodule
