module RAM64to8 (Data_in, address, CS, R_W, clk, Data_out);

input [7:0] Data_in;
input [5:0] address;
input CS,R_W, clk;

reg[7:0] mem[0:5]; // 8 bit memory array list
reg[7:0] mem_out; // store input

output [7:0] Data_out;

//Writing 
always@( R_W == 1 && CS == 1) begin
		mem[address] = Data_in;
	end
	
//Reading 
always@(R_W == 0)begin
	mem_out = mem[address];
end

assign Data_out = CS? mem_out:8'b0;

endmodule