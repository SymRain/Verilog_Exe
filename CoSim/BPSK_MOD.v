module BPSK_MOD(clk, data_bit_in, data_bit_out);
	input clk, data_bit_in;
    output data_bit_out;
    initial
    begin
        data_bit_out = 0;
    end
    always @(posedge clk or negedge clk)
    begin
        if(data_bit_in == 0)
        begin
            data_bit_out <= 0;
        end
        else
        begin
            data_bit_out <= 1;
        end
    end
endmodule

module DE_BPSK_MOD(clk, data_bit_in, data_bit_out);
	input clk, data_bit_in;
    output data_bit_out;
    initial
    begin
        data_bit_out = 0;
    end
    always @(posedge clk or negedge clk)
    begin
        if(data_bit_in == 0)
        begin
            data_bit_out <= 0;
        end
        else
        begin
            data_bit_out <= 1;
        end
    end
endmodule