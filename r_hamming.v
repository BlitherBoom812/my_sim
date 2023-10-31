module r_hamming(
  input [11:0] data_in,
  output reg [7:0] data_out
);

reg [3:0] cnt;
reg [11:0] data;

always @(*)
  begin
    cnt[0] = data_in[10] ^ data_in[8] ^ data_in[6] ^ data_in[4] ^ data_in[2] ^ data_in[0];
    cnt[1] = data_in[10] ^ data_in[9] ^ data_in[6] ^ data_in[5] ^data_in[2] ^ data_in[1];
    cnt[2] = data_in[11] ^ data_in[6] ^ data_in[5] ^ data_in[4] ^ data_in[3];
    cnt[3] = data_in[11] ^ data_in[10] ^ data_in[9] ^ data_in[8] ^ data_in[7];

    data[11:0] = data_in[11:0];
    if (cnt != 0)
      data[cnt - 1] = ~data_in[cnt - 1];
    data_out[7:4] = data[11:8];
    data_out[3:1] = data[6:4];
    data_out[0] = data[2];
  end

endmodule