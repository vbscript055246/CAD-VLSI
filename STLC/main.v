module STLC(S1, S2, light1, light2, clk);
    input S1, S2, clk;
    output[2:0] light1, light2;
    
    reg [3:0] p_state, n_state;
    reg [2:0]OL1, OL2;

    always @(posedge clk)

    begin
        p_state <= n_state;
    end


    always @(*)

    begin

        case (p_state)
            1:begin
                OL1 = 3'b010;
                OL2 = 3'b010;
                n_state <= 2;
            end
            2:begin
                OL1 = 3'b100;
                OL2 = 3'b001;
                n_state <= 3; 
            end
            3:begin
                OL1 = 3'b100;
                OL2 = 3'b001;
                n_state <= 4;  
            end
            4:begin
                OL1 = 3'b100;
                OL2 = 3'b001; 
                if(S1)n_state <= 5;
                else n_state <= 4;
            end

            5:begin
                OL1 = 3'b010;
                OL2 = 3'b010;
                n_state <= 7;
            end

            7:begin
                OL1 = 3'b010;
                OL2 = 3'b010;
                n_state <= 8;
            end

            8:begin
                OL1 = 3'b001;
                OL2 = 3'b100;
                n_state <= 9;
            end

            9:begin
                OL1 = 3'b001;
                OL2 = 3'b100;
                n_state <= 10;
            end

            10:begin
                OL1 = 3'b001;
                OL2 = 3'b100;
                if(S2)n_state <= 11;
                else n_state <= 10;
            end

            11:begin
                OL1 = 3'b010;
                OL2 = 3'b010;
                n_state <= 1;
            end

            default:begin
                OL1 = 3'b000;
                OL2 = 3'b000;
                n_state <= 1;          
            end
            
        endcase
    end
    
    
	assign light1 = OL1;
	assign light2 = OL2;
endmodule
    
    