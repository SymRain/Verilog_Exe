module updown;
	parameter TIMES = 100;
	parameter LIGHTCOUNTER = 3;
	reg[7:0] counter;
	reg[8:1] ledsign;
	reg tick;
	reg arge;
	initial 
		begin
			arge = 0;
			counter = 0;
			ledsign = 0;
			forever
				begin
					#TIMES arge = ~arge;
				end
		end
	always @(posedge arge or negedge arge)
		begin
			if(counter!= 0)
				begin
					counter <= (counter + 1)%LIGHTCOUNTER;
				end	
			else
				begin
					if(ledsign == 0) ledsign = 1;
					ledsign <= ledsign<<1;
					counter <= (counter + 1)%LIGHTCOUNTER;
				end		
		end

endmodule