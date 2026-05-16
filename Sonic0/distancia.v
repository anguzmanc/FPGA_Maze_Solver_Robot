module distancia(
	input [19:0]count,
	output reg rled=0,
	output reg aled=0,
	output reg vled=0,
	output reg xled=0
);

parameter L1=16'd60000; //Para entre 40cm 
parameter L1m=15'd30000;
parameter L2=15'd30000; //Para entre 20cm
parameter L2m=14'd15000;
parameter L3=14'd15000; //Para 10cm
parameter L3m=10'd1000;

always@(count)
	begin
		if(count>L1m && count<L1)
			begin
				rled = 1;
				aled = 0;
				vled = 0;
				xled = 0;
			end
		else if (count>L2m && count<L2)
			begin
				rled = 0;
				aled = 1;
				vled = 0;
				xled = 0;
			end
		else if (count>L3m && count<L3)
			begin
				rled = 0;
				aled = 0;
				vled = 1;
				xled = 0;
			end		
		else begin
				rled = 0;
				aled = 0;
				vled = 0;
				xled = 1;
			end
	end
endmodule
