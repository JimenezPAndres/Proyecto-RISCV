//Descripción General:
//El módulo ALU_Decoder es un decodificador que traduce señales de control y códigos de función 
//en operaciones específicas para la Unidad Lógica Aritmética (ALU). Este módulo toma una señal 
//de control (ALUD) y un código de función (F),y produce una salida (ALUOp) que indica la operación
//que la ALU debe realizar.
//Entradas:
//ALUD (1 bit): Señal de control que influye en la operación de la ALU.
//F (3 bits): Código de función que especifica la operación deseada dentro de la ALU
//Salida:
//ALUOp (2 bits): Código que indica la operación específica que debe realizar la ALU.
//Funcionabilidad:
//El módulo combina las señales de entrada ALUD y F en un solo registro (in_ALU) de 4 bits. Luego, 
//mediante una sentencia casez, se determina la operación de la ALU basada en el valor de in_ALU. 
//Dependiendo del valor de este código combinado, se asigna un output_result de 2 bits, que se asigna 
//a la salida ALUOp.
//Razón de Implementación:
//Este módulo fue creado para que por medio de una señal de control obtenida en el main decoder y el 
//fucnt3 de las operaciones se identifique que operación aritmética debe de realizar la ALU principal. 



module ALU_Decoder(

    input wire ALUD, //salida del main decoder

    input wire [2:0] F, //funct 3

    output wire [1:0] ALUOp //señal de control de la ALU. 

);



    reg [3:0] in_ALU; //unión de F y ALUD

    reg [1:0] output_result; 



always @* begin

    in_ALU = {ALUD, F};

    casez(in_ALU) //para soportar wildcard (z)



        4'b0zzz: output_result = 2'b00; //ADD

        4'b1000: output_result = 2'b00; //ADD

        4'b1100: output_result = 2'b01; //XOR

        4'b1111: output_result = 2'b10; //AND

        4'b1101: output_result = 2'b11; //SRA





        default: output_result = 4'b0000; // Manejo de caso por defecto

    endcase

end



assign ALUOp = output_result; 



endmodule
