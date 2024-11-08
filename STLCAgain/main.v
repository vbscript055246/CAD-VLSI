module STLCA(sensor, r_light, g_light, y_light, clk);
    input sensor, clk;
    output r_light, g_light, y_light;
    
    parameter red = 2'b00;
    parameter green = 2'b01;
    parameter yellow = 2'b10;

    reg [2:0] p_state, n_state;
	reg r_light, g_light, y_light;
	
    always @(posedge clk)
    begin
        p_state <= n_state;
    end


    always @(p_state)
    begin
        case (p_state)
            red:begin
                r_light <= 1;
                g_light <= 0;
                y_light <= 0;
                if(sensor) n_state <= green;
                else n_state <= red;
            end
            green:begin
                r_light <= 0;
                g_light <= 1;
                y_light <= 0;
                n_state <= yellow; 
            end
            yellow:begin
                r_light <= 0;
                g_light <= 0;
                y_light <= 1;
                n_state <= red; 
            end
            default:begin
                n_state <= red; 
            end
        endcase
    end
endmodule
    
    