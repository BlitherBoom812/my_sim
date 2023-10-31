module hamming (
  input [7:0] data_in,
  output [11:0] data_out
);

assign data_out[11:8]  = data_in[7:4];
assign data_out[6:4]  = data_in[3:1];
assign data_out[2]  = data_in[0];
assign data_out[0]  = data_out[10] ^ data_out[8] ^ data_out[6] ^ data_out[4] ^ data_out[2];
assign data_out[1]  = data_out[10] ^ data_out[9] ^ data_out[6] ^ data_out[5] ^data_out[2];
assign data_out[3]  = data_out[11] ^ data_out[6] ^ data_out[5] ^ data_out[4];
assign data_out[7]  = data_out[11] ^ data_out[10] ^ data_out[9] ^ data_out[8];

endmodule