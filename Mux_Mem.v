`timescale 1ns / 1ps

module Mux_Mem(

    input [31:0] ALU,
    input [31:0] Memoria,
    input MemtoReg,
    output [31:0] out_mux_mem
);

    assign out_mux_exte = (MemtoReg) ?  Memoria: ALU;



endmodule
