module Main_Decoder(
    input [5:0] op,
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
        10'b0110011000: output_code = 7'b0010000;
        10'b0110011010: output_code = 7'b0011000;
        10'b0110011111: output_code = 7'b0011000;
        10'b0110011101: output_code = 7'b0011000;

        10'b0010011010: output_code = 7'b0110001;
        10'b0010011111: output_code = 7'b0110000;
        10'b0010011000: output_code = 7'b0110010;

        10'b0100011010: output_code = 7'b1100000;

        10'b0011011zzz: output_code = 7'b0110110;

        10'b0001011zzz: output_code = 7'b0110000;

        
        default: output_code = 7'b0000000;  
    endcase
end

assign Memtoreg = output_code[0];

assign PCSrc = output_code[1];

assign Jalr = output_code[2];

assign ALUD = output_code[3];

assign RegW = output_code[4];

assign ALUSrc = output_code[5];

assign MemW = output_code[6];



endmodule
