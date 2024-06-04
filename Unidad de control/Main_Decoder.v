module Main_Decoder(
    input [5:0] op,
    input wire [2:0] F, 
    output wire ALUD,
    output wire RegW,
    output wire ALUSrc,
    output wire MemW,
    output wire Jalr,
    output wire PCSrc
);

reg [9:0] input_code;
reg [5:0] output_code;  // 4 bits de salida

always @* begin
    input_code = {op, F};
    casez(input_code)
        10'b0110011000: output_code = 6'b001000;
        10'b0110011010: output_code = 6'b001100;
        10'b0110011111: output_code = 6'b001100;
        10'b0110011101: output_code = 6'b001100;

        10'b0010011010: output_code = 6'b011000;
        10'b0010011111: output_code = 6'b011000;
        10'b0010011000: output_code = 6'b011001;

        10'b0100011010: output_code = 6'b110000;

        10'b0011011zzz: output_code = 6'b011011;

        10'b0001011zzz: output_code = 6'b011000;

        
        default: output_code = 6'b000000;  
    endcase
end

assign PCSrc = output_code[0];

assign Jalr = output_code[1];

assign ALUD = output_code[2];

assign RegW = output_code[3];

assign ALUSrc = output_code[4];

assign MemW = output_code[5];




endmodule
