module mux_Jalr(
    input [31:0] PC,
    input [31:0] RS2,
    input Jalr,
    output out_mux_JALR
);

assign out_mux_JALR = (Jalr) ?  PC: RS2;

endmodule
