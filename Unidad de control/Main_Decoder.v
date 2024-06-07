//Descripción:
//El módulo Main_Decoder es un decodificador principal que se 
//encarga de interpretar las instrucciones de un procesador basado 
//en la combinación de los campos de operación (op) y función (F). 
//Dependiendo de la instrucción decodificada, el módulo genera varias
//señales de control que determinan el comportamiento de otros componentes 
//del procesador.
//Entradas: 
//op (7 bits): Código de operación de la instrucción.
//F (3 bits): Código de función adicional que complementa la operación.
//Salidas:
//ALUD (1 bit): Señal de control para determinar el modo de operación de la ALU.
//RegW (1 bit): Señal que habilita la escritura en el registro de destino.
//ALUSrc (1 bit): Señal que selecciona la salida del mux con un rs o extensión de signo
//MemW (1 bit): Señal que habilita la escritura en memoria.
//Jalr (1 bit): Señal que indica si la instrucción es un salto, selecciona salida del mux,
//si es PC o un registro.
//PCSrc (1 bit): Señal que determina la fuente del valor siguiente del contador de programa (PC).
//Memtoreg (1 bit): Señal que selecciona el origen de los datos que se escribirán en el registro
//Funcionabilidad:
//Este módulo decodifica instrucciones de diferentes tipos (R, I, S, J y U) combinando los valores de 
//op y F en un solo registro (input_code). Dependiendo del valor de este código combinado, se genera 
//un output_code de 7 bits que controla varias señales del procesador. La decodificación se realiza 
//mediante una sentencia casez, que permite manejar diferentes combinaciones de bits y wildcard (z).
//Razón de Implementación:
//Este modulo se crea, ya que se ocupa un decodificador que dependiendo de los opcodes y los funct3, 
//determine que señales son necesarias para esa instrucción para así activar las distintas operaciones
//en el resto del circuito. 



module Main_Decoder(

    input [6:0] op, //opcode

    input wire [2:0] F, //funct3

    output wire ALUD, //señal de control para el alu_decoder, 1 operación aritmética

    output wire RegW, //señal de control para saber si se escribe en registros, 1 escribir

    output wire ALUSrc, //señal de control del mux de extensión de signo, 1 para inmediatos

    output wire MemW, //señal de control para saber si se escribe en memoria, 1 escribir

    output wire Jalr, //señal de control para realizar un salto o no, 1 para JAL

    output wire PCSrc, //Señal de control del mux del PC, 1 sale la señal de ALUprincipal

    output wire Memtoreg //señal de control del mux después de data memory, que se lleva al 
    //banco de registro, 1 para sacar la señal que viene de memoria.

);



    reg [9:0] input_code; //unión de op y F

    reg [6:0] output_code;  // 7 bits de salida



always @* begin

    input_code = {op, F};

    casez(input_code) //para soportar wildcards (z)

        //Tipo R

        10'b0110011000: output_code = 7'b0010000;//ADD

        10'b0110011111: output_code = 7'b0011000;//AND

        10'b0110011101: output_code = 7'b0011000;//SRA

        10'b0110011100: output_code = 7'b0011000;//XOR

        //Tipo I

        10'b0000011010: output_code = 7'b0110001;//LW

        10'b0010011000: output_code = 7'b0110000;//ADDI

        10'b1100111000: output_code = 7'b0110010;//JALR

        //Tipo S

        10'b0100011010: output_code = 7'b1100000;//SW

        //Tipo J

        10'b1101111zzz: output_code = 7'b0110110;//JAL

        //Tipo U

        10'b0110111zzz: output_code = 7'b0110000;//LUI



        

        default: output_code = 7'b0000000;  

    endcase

end



assign Memtoreg = output_code[0];



assign PCSrc = output_code[1];



assign Jalr = output_code[2];



assign ALUD = output_code[3];



assign RegW = output_code[4];

//assign RegW = 0;

assign ALUSrc = output_code[5];



assign MemW = output_code[6];







endmodule
