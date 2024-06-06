module Main_Decoder(

    input [6:0] op,

    input wire [2:0] F, 

    output wire ALUD,

    output wire RegW,

    output wire ALUSrc,

    output wire MemW,

    output wire Jalr,

    output wire PCSrc,

    output wire Memtoreg

);



reg [9:0] input_code;

reg [6:0] output_code;  // 4 bits de salida



always @* begin

    input_code = {op, F};

    casez(input_code)

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
