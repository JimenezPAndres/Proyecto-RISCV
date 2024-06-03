module ALU_Decoder(
    input wire ALUD,
    input wire [2:0] F,
    output ALUOp 
);

reg [3:0] in_ALU;
reg output_result;
wire [1:0] ALUOp;

always @* begin
    in_ALU = {ALUD, F};
    casez(in_ALU)

        4'b0zzz: output_result = 2'b00; //ADD
        4'b1z00: output_result = 2'b00; //ADD
        4'b1z01: output_result = 2'b01; //XOR
        4'b1z10: output_result = 2'b10; //AND
        4'b1z11: output_result = 2'b11; //SRA


        default: output_result = 4'b0000; // Manejo de caso por defecto
    endcase
end

assign ALUOp = output_result; 

endmodule
