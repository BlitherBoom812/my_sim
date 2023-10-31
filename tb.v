//~ `New testbench
`timescale 1ns / 1ps

module tb_top;

    // top Parameters
    parameter PERIOD = 10;
    parameter HEADER = 6;

    // top Inputs
    reg         clk = 0;
    reg         rst_n = 0;
    wire         receive_fsk_data;

    // top Outputs
    wire [ 7:0] data_in;
    wire [ 7:0] data_out;
    wire [ 7:0] pcm_data;
    wire [11:0] hamming_data;
    wire [15:0] frame_data;
    wire        fsk_data;
    wire        r_fsk_data;
    wire [11:0] r_frame_data;
    wire        frame_correct;
    wire [ 7:0] r_hamming_data;
    wire [12:0] r_pcm_data;


    assign receive_fsk_data = fsk_data;

    initial begin
        forever #(PERIOD / 2) clk = ~clk;
    end

    initial begin
        #(PERIOD * 2) rst_n = 1;
    end

    top #(
        .HEADER(HEADER)
    ) u_top (
        .sys_clk         (clk),
        .sys_rst         (rst_n),
        .receive_fsk_data(receive_fsk_data),

        .data_in       (data_in[7:0]),
        .data_out      (data_out[7:0]),
        .pcm_data      (pcm_data[7:0]),
        .hamming_data  (hamming_data[11:0]),
        .frame_data    (frame_data[15:0]),
        .fsk_data      (fsk_data),
        .r_fsk_data    (r_fsk_data),
        .r_frame_data  (r_frame_data[11:0]),
        .frame_correct (frame_correct),
        .r_hamming_data(r_hamming_data[7:0]),
        .r_pcm_data    (r_pcm_data[12:0])
    );

    initial begin

        $finish;
    end

endmodule
