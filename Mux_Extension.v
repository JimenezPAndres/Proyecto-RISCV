module mux_extension(
    input [31:0] extension_signo,
    input [31:0] RS1,
    input ALUSrc,
    output [31:0] out_mux_exte
);

assign out_mux_exte = (ALUSrc) ?  extension_signo: RS1;

endmodule
