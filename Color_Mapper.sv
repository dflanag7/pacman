//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


	
	
module  color_mapper ( input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size, 
		       output logic [7:0]  Red, Green, Blue
		     
/////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////

//		      input logic frame_clk, Reset, clk, //over,
//		      input [9:0] GhostXr, GhostYr, GhostXp, GhostYp, GhostXb, GhostYb,
//		      output logic frightened,
		//need to check
//		      output logic [6:0] score,
				);
		      
		     
///////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////

	
	 logic ball_on;
	 logic food_on, foodspec1_on, foodspec2_on, foodspec3_on, foodspec4_on; //foodspec are the special beans
	 //keep track of the beans
	 logic food1_on, food2_on, food3_on, food4_on, food5_on, food6_on, food7_on, food8_on, food9_on, food10_on;
	 logic food11_on, food12_on, food13_on, food14_on, food15_on, food16_on, food17_on, food18_on, food19_on, food20_on;
	 logic food21_on, food22_on, food23_on, food24_on, food25_on, food26_on, food27_on, food28_on, food29_on, food30_on;
	 logic food31_on, food32_on, food33_on, food34_on, food35_on, food36_on, food37_on, food38_on, food39_on, food40_on;
	 logic wall_on;
	 logic ghost_onr, ghost_onp, ghost_onb;
	 //logic [9:0] food_size;
	
	//assign food_size = 1;
	
	
	
	
 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*Ball_Size, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 12 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */
	  
    int DistX, DistY, Size;
	 assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
    assign Size = Ball_size;
	  
    always_comb
    begin:Ball_on_proc
        if ( ( DistX*DistX + DistY*DistY) <= (Size * Size) ) 
            ball_on = 1'b1;
        else 
            ball_on = 1'b0;
     end
	  
	

	//____________________________________________________
	// Drawing beans
	//____________________________________________________

		//food radius = 2
		// special food radius = 3
			
		//if ((DrawX==10'd72)&&(DrawY==10'd24))
		//	food_on=1'b1;
always_comb
	begin
		if ((DrawX > (10'd72 - 10'd2))&&(DrawY > (10'd72 - 10'd2))&&(DrawX <= (10'd72 + 10'd2))&&(DrawY <= (10'd72 + 10'd2)))
			food1_on = 1'b1;
		else
			food1_on = 1'b0;
	end
	
///////////////////////
// SPecial Bean
always_comb
	begin
		if ((DrawX > (10'd72 - 10'd3))&&(DrawY > (10'd168 - 10'd3))&&(DrawX <= (10'd72 + 10'd3))&&(DrawY <= (10'd168 + 10'd3)))
			foodspec1_on=1'b1;
		else
			foodspec1_on = 1'b0;
	end
/////////////////////
		
always_comb
	begin
		if ((DrawX > (10'd72 - 10'd2))&&(DrawY > (10'd264 - 10'd2))&&(DrawX <= (10'd72 + 10'd2))&&(DrawY <= (10'd264 + 10'd2)))
			food2_on=1'b1;
		else
			food2_on = 1'b0;
	end
	
always_comb
	begin
		if ((DrawX > (10'd72 - 10'd2))&&(DrawY > (10'd360 - 10'd2))&&(DrawX <= (10'd72 + 10'd2))&&(DrawY <= (10'd360 + 10'd2)))
			food3_on=1'b1;
		else
			food3_on = 1'b0;
	end 
		
always_comb
	begin
		if ((DrawX > (10'd120 - 10'd2))&&(DrawY > (10'd120 - 10'd2))&&(DrawX <= (10'd120 + 10'd2))&&(DrawY <= (10'd120 + 10'd2)))
			food4_on=1'b1;
		else
			food4_on = 1'b0;
	end

always_comb
	begin
		if ((DrawX > (10'd120 - 10'd2))&&(DrawY > (10'd216 - 10'd2))&&(DrawX <= (10'd120 + 10'd2))&&(DrawY <= (10'd216 + 10'd2)))
			food5_on=1'b1;
		else
			food5_on = 1'b0;
	end
		
always_comb
	begin
		if ((DrawX > (10'd120 - 10'd2))&&(DrawY > (10'd312 - 10'd2))&&(DrawX <= (10'd120 + 10'd2))&&(DrawY <= (10'd312 + 10'd2)))
			food6_on=1'b1;
		else
			food6_on = 1'b0;
	end
		
always_comb
	begin
		if ((DrawX > (10'd120 - 10'd2))&&(DrawY > (10'd216 - 10'd2))&&(DrawX <= (10'd120 + 10'd2))&&(DrawY <= (10'd216 + 10'd2)))
			food7_on=1'b1;
		else
			food7_on = 1'b0;
	end
	
always_comb
	begin
		if ((DrawX > (10'd168 - 10'd2))&&(DrawY > (10'd72 - 10'd2))&&(DrawX <= (10'd168 + 10'd2))&&(DrawY <= (10'd72 + 10'd2)))
			food8_on=1'b1;
		else
			food8_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd168 - 10'd2))&&(DrawY > (10'd168 - 10'd2))&&(DrawX <= (10'd168 + 10'd2))&&(DrawY <= (10'd168 + 10'd2)))
			food9_on=1'b1;
		else
			food9_on = 1'b0;
	end	
	
always_comb
	begin
		if ((DrawX > (10'd168 - 10'd2))&&(DrawY > (10'd264 - 10'd2))&&(DrawX <= (10'd168 + 10'd2))&&(DrawY <= (10'd264 + 10'd2)))
			food10_on=1'b1;
		else
			food10_on = 1'b0;
	end	
		// ///////////////////////
		/////////Special Bean
always_comb
	begin
		if ((DrawX > (10'd168 - 10'd3))&&(DrawY > (10'd360 - 10'd3))&&(DrawX <= (10'd168 + 10'd3))&&(DrawY <= (10'd360 + 10'd3)))
			foodspec2_on=1'b1;
		else
			foodspec2_on = 1'b0;
	end
		//////////////////////////

always_comb
	begin
		if ((DrawX > (10'd216 - 10'd2))&&(DrawY > (10'd120 - 10'd2))&&(DrawX <= (10'd216 + 10'd2))&&(DrawY <= (10'd120 + 10'd2)))
			food11_on=1'b1;
		else
			food11_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd216 - 10'd2))&&(DrawY > (10'd216 - 10'd2))&&(DrawX <= (10'd216 + 10'd2))&&(DrawY <= (10'd216 + 10'd2)))
			food12_on=1'b1;
		else
			food12_on = 1'b0;
	end	
always_comb
	begin
		if ((DrawX > (10'd216 - 10'd2))&&(DrawY > (10'd312 - 10'd2))&&(DrawX <= (10'd216 + 10'd2))&&(DrawY <= (10'd312 + 10'd2)))
			food13_on=1'b1;
		else
			food13_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd216 - 10'd2))&&(DrawY > (10'd408 - 10'd2))&&(DrawX <= (10'd216 + 10'd2))&&(DrawY <= (10'd408 + 10'd2)))
			food14_on=1'b1;
		else
			food14_on = 1'b0;
	end	
always_comb
	begin
		if ((DrawX > (10'd264 - 10'd2))&&(DrawY > (10'd72 - 10'd2))&&(DrawX <= (10'd264 + 10'd2))&&(DrawY <= (10'd72 + 10'd2)))	
			food15_on=1'b1;
		else
			food15_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd264 - 10'd2))&&(DrawY > (10'd168 - 10'd2))&&(DrawX <= (10'd264 + 10'd2))&&(DrawY <= (10'd168 + 10'd2)))
			food16_on=1'b1;
		else
			food16_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd264 - 10'd2))&&(DrawY > (10'd264 - 10'd2))&&(DrawX <= (10'd264 + 10'd2))&&(DrawY <= (10'd264 + 10'd2)))
			food17_on=1'b1;
		else
			food17_on = 1'b0;
	end	
always_comb
	begin
		if ((DrawX > (10'd264 - 10'd2))&&(DrawY > (10'd360 - 10'd2))&&(DrawX <= (10'd264 + 10'd2))&&(DrawY <= (10'd360 + 10'd2)))
			food18_on=1'b1;
		else
			food18_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd312 - 10'd2))&&(DrawY > (10'd120 - 10'd2))&&(DrawX <= (10'd312 + 10'd2))&&(DrawY <= (10'd120 + 10'd2)))
			food19_on=1'b1;
		else
			food19_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd312 - 10'd2))&&(DrawY > (10'd216 - 10'd2))&&(DrawX <= (10'd312 + 10'd2))&&(DrawY <= (10'd216 + 10'd2)))
			food20_on=1'b1;
		else
			food20_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd312 - 10'd2))&&(DrawY > (10'd312 - 10'd2))&&(DrawX <= (10'd312 + 10'd2))&&(DrawY <= (10'd312 + 10'd2)))
			food21_on=1'b1;
		else
			food21_on = 1'b0;
	end
		
always_comb
	begin
		if ((DrawX > (10'd312 - 10'd2))&&(DrawY > (10'd408 - 10'd2))&&(DrawX <= (10'd312 + 10'd2))&&(DrawY <= (10'd408 + 10'd2)))
			food22_on=1'b1;
		else
			food22_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd360 - 10'd2))&&(DrawY > (10'd72 - 10'd2))&&(DrawX <= (10'd360 + 10'd2))&&(DrawY <= (10'd72 + 10'd2)))
			food23_on=1'b1;
		else
			food23_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd360 - 10'd2))&&(DrawY > (10'd168 - 10'd2))&&(DrawX <= (10'd360 + 10'd2))&&(DrawY <= (10'd168 + 10'd2)))
			food24_on=1'b1;
		else
			food24_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd360 - 10'd2))&&(DrawY > (10'd264 - 10'd2))&&(DrawX <= (10'd360 + 10'd2))&&(DrawY <= (10'd264 + 10'd2)))
			food25_on=1'b1;
		else
			food25_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd360 - 10'd2))&&(DrawY > (10'd360 - 10'd2))&&(DrawX <= (10'd360 + 10'd2))&&(DrawY <= (10'd360 + 10'd2)))
			food26_on=1'b1;
		else
			food26_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd408 - 10'd2))&&(DrawY > (10'd120 - 10'd2))&&(DrawX <= (10'd408 + 10'd2))&&(DrawY <= (10'd120 + 10'd2)))
			food27_on=1'b1;
		else
			food27_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd408 - 10'd2))&&(DrawY > (10'd216 - 10'd2))&&(DrawX <= (10'd408 + 10'd2))&&(DrawY <= (10'd216 + 10'd2)))
			food28_on=1'b1;
		else
			food28_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd408 - 10'd2))&&(DrawY > (10'd312 - 10'd2))&&(DrawX <= (10'd408 + 10'd2))&&(DrawY <= (10'd312 + 10'd2)))
			food29_on=1'b1;
		else
			food29_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd408 - 10'd2))&&(DrawY > (10'd408 - 10'd2))&&(DrawX <= (10'd408 + 10'd2))&&(DrawY <= (10'd408 + 10'd2)))
			food30_on=1'b1;
		else
			food30_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd456 - 10'd2))&&(DrawY > (10'd72 - 10'd2))&&(DrawX <= (10'd456 + 10'd2))&&(DrawY <= (10'd72 + 10'd2)))
			food31_on=1'b1;
		else
			food31_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd456 - 10'd2))&&(DrawY > (10'd168 - 10'd2))&&(DrawX <= (10'd456 + 10'd2))&&(DrawY <= (10'd168 + 10'd2)))
			food32_on=1'b1;
		else
			food32_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd456 - 10'd2))&&(DrawY > (10'd264 - 10'd2))&&(DrawX <= (10'd456 + 10'd2))&&(DrawY <= (10'd264 + 10'd2)))
			food33_on=1'b1;
		else
			food33_on = 1'b0;
	end
		//////////////////
		// Special Bean

always_comb
	begin
		if ((DrawX > (10'd456 - 10'd3))&&(DrawY > (10'd360 - 10'd3))&&(DrawX <= (10'd456 + 10'd3))&&(DrawY <= (10'd360 + 10'd3)))
			foodspec3_on=1'b1;
		else
			foodspec3_on = 1'b0;
	end
		/////////////////////

always_comb
	begin
		if ((DrawX > (10'd504 - 10'd2))&&(DrawY > (10'd120 - 10'd2))&&(DrawX <= (10'd504 + 10'd2))&&(DrawY <= (10'd120 + 10'd2)))
			food34_on=1'b1;
		else
			food34_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd504 - 10'd2))&&(DrawY > (10'd216 - 10'd2))&&(DrawX <= (10'd504 + 10'd2))&&(DrawY <= (10'd216 + 10'd2)))
			food35_on=1'b1;
		else
			food35_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd504 - 10'd2))&&(DrawY > (10'd312 - 10'd2))&&(DrawX <= (10'd504 + 10'd2))&&(DrawY <= (10'd312 + 10'd2)))
			food36_on=1'b1;
		else
			food36_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd504 - 10'd2))&&(DrawY > (10'd408 - 10'd2))&&(DrawX <= (10'd504 + 10'd2))&&(DrawY <= (10'd408 + 10'd2)))
			food37_on=1'b1;
		else
			food37_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd552 - 10'd2))&&(DrawY > (10'd72 - 10'd2))&&(DrawX <= (10'd552 + 10'd2))&&(DrawY <= (10'd72 + 10'd2)))
			food38_on=1'b1;
		else
			food38_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd552 - 10'd3))&&(DrawY > (10'd168 - 10'd3))&&(DrawX <= (10'd552 + 10'd3))&&(DrawY <= (10'd168 + 10'd3)))
			foodspec4_on=1'b1;
		else
			foodspec4_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd552 - 10'd2))&&(DrawY > (10'd264 - 10'd2))&&(DrawX <= (10'd552 + 10'd2))&&(DrawY <= (10'd264 + 10'd2)))
			food39_on=1'b1;
		else
			food39_on = 1'b0;
	end
always_comb
	begin
		if ((DrawX > (10'd552 - 10'd2))&&(DrawY > (10'd360 - 10'd2))&&(DrawX <= (10'd552 + 10'd2))&&(DrawY <= (10'd360 + 10'd2)))
			food40_on=1'b1;
		else
			food40_on = 1'b0;
	end
	
	
	
	
	//____________________________________________________
	// Wall
	//____________________________________________________
	
	
	
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
		
		
		
	/*	else if((DrawX>10'd93)&&(DrawX<10'd98)&&(DrawY>10'd264)&&(DrawY<10'd384))
			wall_on=1'b1;
		
		
		else if((DrawX>10'd526)&&(DrawX<10'd531)&&(DrawY>10'd96)&&(DrawY<10'd168))
			wall_on=1'b1;
		else if((DrawY>10'd526)&&(DrawY<10'd531)&&(DrawX>10'd456)&&(DrawX<10'd528))
			wall_on=1'b1;
		else if((DrawX>10'd526)&&(DrawX<10'd531)&&(DrawY>10'd312)&&(DrawY<10'd384))
			wall_on=1'b1;
		else if((DrawY>10'd382)&&(DrawY<10'd387)&&(DrawX>10'd456)&&(DrawX<10'd528))
			wall_on=1'b1;
		
	*/	
		
	//	else if((DrawX>10'd93)&&(DrawX<10'd98)&&(DrawY>10'd96)&&(DrawY<10'd198)
		
			
			
		else 
			wall_on=1'b0;
	end
	
	
	
			
		
		 // Check if the pixel is in the wall
	 /* always_comb
	 begin
		if(DrawY < 10'd8) begin wall_on = 1'b1; end
		else if (DrawX < 10'd8) begin wall_on = 1'b1; end
		else if (DrawY > 10'd471) begin wall_on = 1'b1; end
		else if (DrawX > 10'd631) begin wall_on = 1'b1; end
		else if (DrawX>10'd15 && DrawX<10'd40 && DrawY>10'd15 && DrawY<10'd112) begin wall_on = 1'b1; end
		else if (DrawX>10'd15 && DrawX<10'd40 && DrawY>10'd119 && DrawY<10'd152) begin wall_on = 1'b1; end
		else if (DrawX>10'd15 && DrawX<10'd24 && DrawY>10'd151 && DrawY<10'd224) begin wall_on = 1'b1; end
		else if (DrawX>10'd31 && DrawX<10'd40 && DrawY>10'd159 && DrawY<10'd224) begin wall_on = 1'b1; end
		else if (DrawX>10'd15 && DrawX<10'd40 && DrawY>10'd223 && DrawY<10'd232) begin wall_on = 1'b1; end
		else if (DrawX>10'd15 && DrawX<10'd40 && DrawY>10'd239 && DrawY<10'd256) begin wall_on = 1'b1; end
		else if (DrawX>10'd15 && DrawX<10'd24 && DrawY>10'd255 && DrawY<10'd392) begin wall_on = 1'b1; end
		else if (DrawX>10'd31 && DrawX<10'd40 && DrawY>10'd263 && DrawY<10'd384) begin wall_on = 1'b1; end
		else if (DrawX>10'd15 && DrawX<10'd40 && DrawY>10'd391 && DrawY<10'd400) begin wall_on = 1'b1; end
		else if (DrawX>10'd15 && DrawX<10'd40 && DrawY>10'd407 && DrawY<10'd472) begin wall_on = 1'b1; end
		else if (DrawX>10'd47 && DrawX<10'd96 && DrawY>10'd15 && DrawY<10'd104) begin wall_on = 1'b1; end
		else if (DrawX>10'd47 && DrawX<10'd96 && DrawY>10'd111 && DrawY<10'd216) begin wall_on = 1'b1; end
		else if (DrawX>10'd47 && DrawX<10'd96 && DrawY>10'd223 && DrawY<10'd320) begin wall_on = 1'b1; end
		else if (DrawX>10'd47 && DrawX<10'd96 && DrawY>10'd327 && DrawY<10'd392) begin wall_on = 1'b1; end
		else if (DrawX>10'd47 && DrawX<10'd96 && DrawY>10'd399 && DrawY<10'd464) begin wall_on = 1'b1; end
		else if (DrawX>10'd103 && DrawX<10'd160 && DrawY>10'd15 && DrawY<10'd112) begin wall_on = 1'b1; end
		else if (DrawX>10'd103 && DrawX<10'd160 && DrawY>10'd119 && DrawY<10'd224) begin wall_on = 1'b1; end
		else if (DrawX>10'd103 && DrawX<10'd160 && DrawY>10'd231 && DrawY<10'd328) begin wall_on = 1'b1; end
		else if (DrawX>10'd103 && DrawX<10'd160 && DrawY>10'd335 && DrawY<10'd400) begin wall_on = 1'b1; end
		else if (DrawX>10'd103 && DrawX<10'd160 && DrawY>10'd407 && DrawY<10'd464) begin wall_on = 1'b1; end
		else if (DrawX>10'd167 && DrawX<10'd256 && DrawY>10'd15 && DrawY<10'd128) begin wall_on = 1'b1; end
		else if (DrawX>10'd167 && DrawX<10'd256 && DrawY>10'd135 && DrawY<10'd264) begin wall_on = 1'b1; end
		else if (DrawX>10'd167 && DrawX<10'd256 && DrawY>10'd271 && DrawY<10'd376) begin wall_on = 1'b1; end
		else if (DrawX>10'd167 && DrawX<10'd256 && DrawY>10'd383 && DrawY<10'd464) begin wall_on = 1'b1; end
		else if (DrawX>10'd263 && DrawX<10'd320 && DrawY>10'd15 && DrawY<10'd128) begin wall_on = 1'b1; end
		else if (DrawX>10'd263 && DrawX<10'd320 && DrawY>10'd135 && DrawY<10'd248) begin wall_on = 1'b1; end
		else if (DrawX>10'd263 && DrawX<10'd320 && DrawY>10'd255 && DrawY<10'd384) begin wall_on = 1'b1; end
		else if (DrawX>10'd263 && DrawX<10'd320 && DrawY>10'd391 && DrawY<10'd464) begin wall_on = 1'b1; end
		else if (DrawX>10'd327 && DrawX<10'd376 && DrawY>10'd15 && DrawY<10'd104) begin wall_on = 1'b1; end
		else if (DrawX>10'd327 && DrawX<10'd376 && DrawY>10'd111 && DrawY<10'd208) begin wall_on = 1'b1; end
		else if (DrawX>10'd327 && DrawX<10'd376 && DrawY>10'd215 && DrawY<10'd320) begin wall_on = 1'b1; end
		else if (DrawX>10'd327 && DrawX<10'd376 && DrawY>10'd327 && DrawY<10'd464) begin wall_on = 1'b1; end
		else if (DrawX>10'd383 && DrawX<10'd424 && DrawY>10'd15 && DrawY<10'd128) begin wall_on = 1'b1; end
		else if (DrawX>10'd383 && DrawX<10'd424 && DrawY>10'd135 && DrawY<10'd208) begin wall_on = 1'b1; end
		else if (DrawX>10'd383 && DrawX<10'd424 && DrawY>10'd215 && DrawY<10'd288) begin wall_on = 1'b1; end
		else if (DrawX>10'd383 && DrawX<10'd424 && DrawY>10'd295 && DrawY<10'd416) begin wall_on = 1'b1; end
		else if (DrawX>10'd383 && DrawX<10'd424 && DrawY>10'd423 && DrawY<10'd464) begin wall_on = 1'b1; end
		else if (DrawX>10'd431 && DrawX<10'd480 && DrawY>10'd15 && DrawY<10'd120) begin wall_on = 1'b1; end
		else if (DrawX>10'd431 && DrawX<10'd480 && DrawY>10'd127 && DrawY<10'd240) begin wall_on = 1'b1; end
		else if (DrawX>10'd431 && DrawX<10'd480 && DrawY>10'd247 && DrawY<10'd368) begin wall_on = 1'b1; end
		else if (DrawX>10'd431 && DrawX<10'd480 && DrawY>10'd375 && DrawY<10'd464) begin wall_on = 1'b1; end
		else if (DrawX>10'd487 && DrawX<10'd528 && DrawY>10'd7 && DrawY<10'd112) begin wall_on = 1'b1; end
		else if (DrawX>10'd487 && DrawX<10'd528 && DrawY>10'd119 && DrawY<10'd216) begin wall_on = 1'b1; end
		else if (DrawX>10'd487 && DrawX<10'd528 && DrawY>10'd223 && DrawY<10'd344) begin wall_on = 1'b1; end
		else if (DrawX>10'd487 && DrawX<10'd552 && DrawY>10'd351 && DrawY<10'd464) begin wall_on = 1'b1; end
		else if (DrawX>10'd535 && DrawX<10'd584 && DrawY>10'd15 && DrawY<10'd128) begin wall_on = 1'b1; end
		else if (DrawX>10'd535 && DrawX<10'd584 && DrawY>10'd135 && DrawY<10'd232) begin wall_on = 1'b1; end
		else if (DrawX>10'd535 && DrawX<10'd584 && DrawY>10'd239 && DrawY<10'd344) begin wall_on = 1'b1; end
		else if (DrawX>10'd559 && DrawX<10'd584  && DrawY>10'd351 && DrawY<10'd464) begin wall_on = 1'b1; end
		else if (DrawX>10'd591 && DrawX<10'd632  && DrawY>10'd15 && DrawY<10'd104) begin wall_on = 1'b1; end
		else if (DrawX>10'd591 && DrawX<10'd624  && DrawY>10'd111 && DrawY<10'd224) begin wall_on = 1'b1; end
		else if (DrawX>10'd591 && DrawX<10'd632  && DrawY>10'd231 && DrawY<10'd344) begin wall_on = 1'b1; end
		else if (DrawX>10'd591 && DrawX<10'd624  && DrawY>10'd351 && DrawY<10'd464) begin wall_on = 1'b1; end
		else begin wall_on = 1'b0;  end
	 end	
	*/
		
		
		
    always_comb
    begin:RGB_Display
	
			if ((wall_on == 1'b1))
			begin
				Red = 8'h2e;
            Green = 8'hb9;
            Blue = 8'hf7;
			end   
	
        else if ((ball_on == 1'b1)) 
        begin 
            Red = 8'hff;
            Green = 8'hff;
            Blue = 8'h00;
        end    
	/*	  else if ((food_on == 1'b1)) 
        begin 
            Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
        end 
		*/  
		  //beans
       else if ((food1_on == 1'b1)||(food2_on == 1'b1)||(food3_on == 1'b1)||(food4_on == 1'b1)||(food5_on == 1'b1)||(food6_on == 1'b1)||(food7_on == 1'b1)||(food8_on == 1'b1)||(food9_on == 1'b1)||(food10_on == 1'b1)) 
		  begin 
            Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
        end 
		  
        else if ((food11_on == 1'b1)||(food12_on == 1'b1)||(food13_on == 1'b1)||(food14_on == 1'b1)||(food15_on == 1'b1)||(food16_on == 1'b1)||(food17_on == 1'b1)||(food18_on == 1'b1)||(food19_on == 1'b1)||(food20_on == 1'b1))
		  begin 
            Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
        end 
		  
        else if ((food21_on == 1'b1)||(food22_on == 1'b1)||(food23_on == 1'b1)||(food24_on == 1'b1)||(food25_on == 1'b1)||(food26_on == 1'b1)||(food27_on == 1'b1)||(food28_on == 1'b1)||(food29_on == 1'b1)||(food30_on == 1'b1))
		  begin 
            Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
        end 
		  
        else if ((food31_on == 1'b1)||(food32_on == 1'b1)||(food33_on == 1'b1)||(food34_on == 1'b1)||(food35_on == 1'b1)||(food36_on == 1'b1)||(food37_on == 1'b1)||(food38_on == 1'b1)||(food39_on == 1'b1)||(food40_on == 1'b1))
		  begin 
            Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
        end 
		  
		  //special beans
        else if ((foodspec1_on == 1'b1)||(foodspec2_on == 1'b1)||(foodspec3_on == 1'b1)||(foodspec4_on == 1'b1)) 
		  begin 
            Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
        end 
		 
		  else 
		  begin 
            Red = 8'h00; 
            Green = 8'h00;
            Blue = 8'h00;
        end      
    end 
    
endmodule
