module DE_Liner_Code(clk_compliete, clk_in, clk_out, data_bit_in, data_bit_out, clk_enable_in);
	input clk_in, data_bit_in, clk_compliete;
    output clk_out, data_bit_out, clk_enable_in;
    parameter par_code_line = 7;
    parameter par_code_check = 3;
    reg reg_code[par_code_line - 1:0];
    reg reg_check[par_code_line * par_code_check - 1:0];
    reg reg_after_code[par_code_line - 1:0];
    reg reg_check_code[par_code_check - 1:0];
    reg [par_code_line - 1:0] reg_count;
    integer i;
    initial
    begin
        data_bit_out = 0;
        clk_out = 0;
        clk_enable_in = 1;
    end
    always @(posedge clk_in)
    begin
        if(clk_compliete == 1)
        begin
        clk_out = 0;
        end
        if(clk_enable_in == 1)
            if(reg_count == par_code_line)
            begin
            reg_count <= 0;
            clk_enable_in <= 0;
            end
            else
            begin
                reg_count <= reg_count + 1;
                reg_code[reg_count] <= data_bit_in;
            end
        end
    end

    always @(negedge clk_enable_in)
    begin
        if(clk_out == 0
        begin
            for(i = 0; i < par_code_check; i++)
            begin
            reg_check_code[i] <= reg_code[0] * reg_check[i*0 + 0] 
                +  reg_code[1] * reg_check[1 * par_code_check + i]
                +  reg_code[2] * reg_check[2 * par_code_check + i]
                +  reg_code[3] * reg_check[3 * par_code_check + i]
                +  reg_code[4] * reg_check[4 * par_code_check + i]
                +  reg_code[5] * reg_check[5 * par_code_check + i]
                +  reg_code[6] * reg_check[6 * par_code_check + i]
                +  reg_code[7] * reg_check[7 * par_code_check + i];
            end
            clk_enable_in <= 1;
            clk_out <= 1;
            reg_count <= reg_check_code[0] + reg_check_code[1]*2 + reg_check_code[2] * 4;
        end
    end

    always @(posedge clk_out)
    begin
        if(clk_enable_in == 1)
        begin
            //add finding error pattern codes here and save the result in reg_after_code
        end
        for(i = 0; i < par_code_line; i++) reg_after_code[i] <= reg_after_code[i] + reg_code[i];
        clk_enable_in <= 0;
    end
endmodule