module RAM256to32 (Din, address, R_W, clk, Dout);

parameter N = 31;
input [N:0] Din; 
input [7:0] address;
input R_W, clk;

output wire [N:0] Dout;

wire [3:0] CS;
wire CS0, CS1, CS2, CS3;

wire [N:0] D0, D1, D2, D3;

Decoder2to4 inst0 (address[7:6], CS);

assign CS0 = CS[0];
assign CS1 = CS[1];
assign CS2 = CS[2];
assign CS3 = CS[3];

//first row
RAM64to8 inst1 (Din[7:0], address[5:0], R_W, CS0, clk, D0[7:0]);
RAM64to8 inst2 (Din[15:8], address[5:0], R_W, CS0, clk, D0[15:8]);
RAM64to8 inst3 (Din[23:16], address[5:0], R_W, CS0, clk, D0[23:16]);
RAM64to8 inst4 (Din[31:24], address[5:0], R_W, CS0, clk, D0[31:24]);

// second row
RAM64to8 inst5 (Din[7:0], address[5:0], R_W, CS1, clk, D1[7:0]);
RAM64to8 inst6 (Din[15:8], address[5:0], R_W, CS1, clk, D1[15:8]);
RAM64to8 inst7 (Din[23:16], address[5:0], R_W, CS1, clk, D1[23:16]);
RAM64to8 inst8 (Din[31:24], address[5:0], R_W, CS1, clk, D1[31:24]);

//third row
RAM64to8 inst9 (Din[7:0], address[5:0], R_W, CS2, clk, D2[7:0]);
RAM64to8 inst10 (Din[15:8], address[5:0], R_W, CS2, clk, D2[15:8]);
RAM64to8 inst11 (Din[23:16], address[5:0], R_W, CS2, clk, D2[23:16]);
RAM64to8 inst12 (Din[31:24], address[5:0], R_W, CS2, clk, D2[31:24]);

//fourth row
RAM64to8 inst13 (Din[7:0], address[5:0], R_W, CS3, clk, D3[7:0]);
RAM64to8 inst14 (Din[15:8], address[5:0], R_W, CS3, clk, D3[15:8]);
RAM64to8 inst15 (Din[23:16], address[5:0], R_W, CS3, clk, D3[23:16]);
RAM64to8 inst16 (Din[31:24], address[5:0], R_W, CS3, clk, D3[31:24]);

//tri state buffer
assign Dout = (CS0 == 1'b0) ? D0:
(CS1 == 1'b0) ?D1:
(CS2 == 1'b0) ?D2: 
(CS3 == 1'b0) ?D3:32'b0;


endmodule