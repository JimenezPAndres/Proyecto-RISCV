module ALU_Decoder(

    input wire ALUD,

    input wire [2:0] F,

    output wire [1:0] ALUOp 

);



reg [3:0] in_ALU;

reg [1:0] output_result;



always @* begin

    in_ALU = {ALUD, F};

    casez(in_ALU)



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
