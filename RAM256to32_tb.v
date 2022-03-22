module RAM256to32_tb;

parameter N = 31;
reg [N:0] Din; 
reg [7:0] address;
reg R_W;
reg clk;

wire [N:0] Dout;

RAM256to32 dut(.Din(Din), .address(address), .R_W(R_W), .clk(clk), .Dout(Dout));

initial begin

clk = 1'b0;
end

always

#10 clk <= ~clk;


initial begin
    #20
	 Din = 32'b0;
    address = 8'b0;
	 // reading : no output
    R_W = 1'b1;

    #20;
	 // writing : output
    R_W = 1'b0;
	 
    
	 #20
	 Din = 32'b11;
    address = 8'b01;
    R_W = 1'b1;
	 
	 #20
	 R_W = 1'b0;
	 
	 
end

endmodule