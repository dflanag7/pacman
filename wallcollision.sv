module wallcollision (
              input [9:0]  DrawX, DrawY,	
							output logic wall_on
							);
              
	always_comb
	begin

  //boarder
	
		if ((DrawX>10'd22)&&(DrawX<10'd26)&&(DrawY>10'd22)&&(DrawY<10'd458))
			wall_on=1'b1;
		else if ((DrawX>10'd26)&&(DrawX<10'd602)&&(DrawY>10'd22)&&(DrawY<10'd26))
			wall_on=1'b1;
		else if ((DrawX>10'd26)&&(DrawX<10'd602)&&(DrawY>10'd454)&&(DrawY<10'd458))
			wall_on=1'b1;
		else if ((DrawX>10'd598)&&(DrawX<10'd602)&&(DrawY>10'd22)&&(DrawY<10'd458))
			wall_on=1'b1;
			
	//maze walls		
			//L shape 1
		else if((DrawX>10'd93)&&(DrawX<10'd98)&&(DrawY>10'd96)&&(DrawY<10'd168))
			wall_on=1'b1;
		else if((DrawY>10'd93)&&(DrawY<10'd98)&&(DrawX>10'd96)&&(DrawX<10'd168))
			wall_on=1'b1;
		
		// L shape 2
		else if((DrawX>10'd93)&&(DrawX<10'd98)&&(DrawY>10'd264)&&(DrawY<10'd384))
			wall_on=1'b1;
		else if((DrawY>10'd382)&&(DrawY<10'd387)&&(DrawX>10'd96)&&(DrawX<10'd168))
			wall_on=1'b1;
		
		// L shape 3
		else if((DrawX>10'd526)&&(DrawX<10'd531)&&(DrawY>10'd96)&&(DrawY<10'd168))
			wall_on=1'b1;
		else if((DrawY>10'd93)&&(DrawY<10'd98)&&(DrawX>10'd456)&&(DrawX<10'd527))
			wall_on=1'b1; 
		
		//L shape 4
		else if((DrawX>10'd526)&&(DrawX<10'd531)&&(DrawY>10'd264)&&(DrawY<10'd384))
			wall_on=1'b1;
		else if((DrawY>10'd382)&&(DrawY<10'd387)&&(DrawX>10'd456)&&(DrawX<10'd527))
			wall_on=1'b1;		
			
			
		else 
			wall_on=1'b0;
	end
    
				
endmodule
