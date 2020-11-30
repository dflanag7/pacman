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
		       output logic [7:0]  Red, Green, Blue, 
		     
/////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////

		      input logic frame_clk, Reset, clk, //over,
		      input [9:0] GhostXr, GhostYr, GhostXp, GhostYp, GhostXb, GhostYb,
		      ouput logic frightened,
		//need to check
		      output logic [6:0] score,
		      
		     
///////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////
		     );
    
    	 logic ball_on;
	 logic food_on, foodspec1_on, foodspec2_on, foodspec3_on, foodspec4_on; //foodspec are the special beans
	 //keep track of the beans
	 logic food1_on, food2_on, food3_on, food4_on, food5_on, food6_on, food7_on, food8_on, food9_on, food10_on;
	 logic food11_on, food12_on, food13_on, food14_on, food15_on, food16_on, food17_on, food18_on, food19_on, food20_on;
	 logic food21_on, food22_on, food23_on, food24_on, food25_on, food26_on, food27_on, food28_on, food29_on, food30_on;
	 logic food31_on, food32_on, food33_on, food34_on, food35_on, food36_on, food37_on, food38_on, food39_on, food40_on;
	 logic wall_on;
	 logic ghost_onr, ghost_onp, ghost_onb;
	 logic [9:0] food_size;
	
	assign food_size = 1;
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
   
	
	
	always_comb
	begin
		//food radius = 2
		// special food radius = 3
			
		//if ((DrawX==10'd72)&&(DrawY==10'd24))
		//	food_on=1'b1;
		if ((DrawX > (10'd72 - 10'd2))&&(DrawY > (10'd72 - 10'd2))&&(DrawX <= (10'd72 + 10'd2))&&(DrawY <= (10'd72 + 10'd2))
			food1_on=1'b1;
		//else if ((DrawX==10'd72)&&(DrawY==10'd120))
		//	food_on=1'b1;
		///////////////////////
		// SPecial Bean
		//else if ((DrawX==10'd72)&&(DrawY==10'd168))
		else if ((DrawX > (10'd72 - 10'd3))&&(DrawY > (10'd168 - 10'd3))&&(DrawX <= (10'd72 + 10'd3))&&(DrawY <= (10'd168 + 10'd3))
			foodspec1_on=1'b1;
		/////////////////////
		//else if ((DrawX==10'd72)&&(DrawY==10'd216))
		//	food_on=1'b1;
		//else if ((DrawX==10'd72)&&(DrawY==10'd264))
		else if ((DrawX > (10'd72 - 10'd2))&&(DrawY > (10'd264 - 10'd2))&&(DrawX <= (10'd72 + 10'd2))&&(DrawY <= (10'd264 + 10'd2))
			food2_on=1'b1;
		//else if ((DrawX==10'd72)&&(DrawY==10'd312))
		//	food_on=1'b1;
		//else if ((DrawX==10'd72)&&(DrawY==10'd360))
		else if ((DrawX > (10'd72 - 10'd2))&&(DrawY > (10'd360 - 10'd2))&&(DrawX <= (10'd72 + 10'd2))&&(DrawY <= (10'd360 + 10'd2))
			food3_on=1'b1;
		//else if ((DrawX==10'd72)&&(DrawY==10'd408))
		//	food_on=1'b1;
		//else if ((DrawX==10'd72)&&(DrawY==10'd456))
		//	food_on=1'b1;
			
		//else if ((DrawX==10'd120)&&(DrawY==10'd24))
		//	food_on=1'b1;
		//else if ((DrawX==10'd120)&&(DrawY==10'd72))
		//	food_on=1'b1;
		//else if ((DrawX==10'd120)&&(DrawY==10'd120))
		else if ((DrawX > (10'd120 - 10'd2))&&(DrawY > (10'd120 - 10'd2))&&(DrawX <= (10'd120 + 10'd2))&&(DrawY <= (10'd120 + 10'd2))
			food4_on=1'b1;
		//else if ((DrawX==10'd120)&&(DrawY==10'd168))
		//	food_on=1'b1;
		//else if ((DrawX==10'd120)&&(DrawY==10'd216))
		else if ((DrawX > (10'd120 - 10'd2))&&(DrawY > (10'd216 - 10'd2))&&(DrawX <= (10'd120 + 10'd2))&&(DrawY <= (10'd216 + 10'd2))
			food5_on=1'b1;
		//else if ((DrawX==10'd120)&&(DrawY==10'd264))
		//	food_on=1'b1;
		//else if ((DrawX==10'd120)&&(DrawY==10'd312))
		else if ((DrawX > (10'd120 - 10'd2))&&(DrawY > (10'd312 - 10'd2))&&(DrawX <= (10'd120 + 10'd2))&&(DrawY <= (10'd312 + 10'd2))
			food6_on=1'b1;
		//else if ((DrawX==10'd120)&&(DrawY==10'd360))
		//	food_on=1'b1;
		//else if ((DrawX==10'd120)&&(DrawY==10'd408))
		else if ((DrawX > (10'd120 - 10'd2))&&(DrawY > (10'd216 - 10'd2))&&(DrawX <= (10'd120 + 10'd2))&&(DrawY <= (10'd216 + 10'd2))
			food7_on=1'b1;
		//else if ((DrawX==10'd120)&&(DrawY==10'd456))
		//	food_on=1'b1;
			
		//else if ((DrawX==10'd168)&&(DrawY==10'd24))
		//	food_on=1'b1;
		//else if ((DrawX==10'd168)&&(DrawY==10'd72))
		else if ((DrawX > (10'd168 - 10'd2))&&(DrawY > (10'd72 - 10'd2))&&(DrawX <= (10'd168 + 10'd2))&&(DrawY <= (10'd72 + 10'd2))
			food8_on=1'b1;
		//else if ((DrawX==10'd168)&&(DrawY==10'd120))
		//	food_on=1'b1;
		//else if ((DrawX==10'd168)&&(DrawY==10'd168))
		else if ((DrawX > (10'd168 - 10'd2))&&(DrawY > (10'd168 - 10'd2))&&(DrawX <= (10'd168 + 10'd2))&&(DrawY <= (10'd168 + 10'd2))
			food9_on=1'b1;
		//else if ((DrawX==10'd168)&&(DrawY==10'd216))
		//	food_on=1'b1;
		//else if ((DrawX==10'd168)&&(DrawY==10'd264))
		else if ((DrawX > (10'd168 - 10'd2))&&(DrawY > (10'd264 - 10'd2))&&(DrawX <= (10'd168 + 10'd2))&&(DrawY <= (10'd264 + 10'd2))
			food10_on=1'b1;
		//else if ((DrawX==10'd168)&&(DrawY==10'd312))
		//	food_on=1'b1;
		// ///////////////////////
		/////////Special Bean
		//else if ((DrawX==10'd168)&&(DrawY==10'd360))
		else if ((DrawX > (10'd168 - 10'd3))&&(DrawY > (10'd360 - 10'd3))&&(DrawX <= (10'd168 + 10'd3))&&(DrawY <= (10'd360 + 10'd3))
			foodspec2_on=1'b1;
		//////////////////////////
		//else if ((DrawX==10'd168)&&(DrawY==10'd408))
		//	food_on=1'b1;
		//else if ((DrawX==10'd168)&&(DrawY==10'd456))
		//	food_on=1'b1;
			
		//else if ((DrawX==10'd216)&&(DrawY==10'd24))
		//	food_on=1'b1;
		//else if ((DrawX==10'd216)&&(DrawY==10'd72))
		//	food_on=1'b1;
		//else if ((DrawX==10'd216)&&(DrawY==10'd120))
		else if ((DrawX > (10'd216 - 10'd2))&&(DrawY > (10'd120 - 10'd2))&&(DrawX <= (10'd216 + 10'd2))&&(DrawY <= (10'd120 + 10'd2))
			food11_on=1'b1;
		//else if ((DrawX==10'd216)&&(DrawY==10'd168))
		//	food_on=1'b1;
		// else if ((DrawX==10'd216)&&(DrawY==10'd216))
		else if ((DrawX > (10'd216 - 10'd2))&&(DrawY > (10'd216 - 10'd2))&&(DrawX <= (10'd216 + 10'd2))&&(DrawY <= (10'd216 + 10'd2))
			food12_on=1'b1;
		//else if ((DrawX==10'd216)&&(DrawY==10'd264))
		//	food_on=1'b1;
		//else if ((DrawX==10'd216)&&(DrawY==10'd312))
		else if ((DrawX > (10'd216 - 10'd2))&&(DrawY > (10'd312 - 10'd2))&&(DrawX <= (10'd216 + 10'd2))&&(DrawY <= (10'd312 + 10'd2))
			food13_on=1'b1;
		//else if ((DrawX==10'd216)&&(DrawY==10'd360))
		//	food_on=1'b1;
		// else if ((DrawX==10'd216)&&(DrawY==10'd408))
		else if ((DrawX > (10'd216 - 10'd2))&&(DrawY > (10'd408 - 10'd2))&&(DrawX <= (10'd216 + 10'd2))&&(DrawY <= (10'd408 + 10'd2))
			food14_on=1'b1;
		//else if ((DrawX==10'd216)&&(DrawY==10'd456))
		//	food_on=1'b1;
			
		//else if ((DrawX==10'd264)&&(DrawY==10'd24))
		//	food_on=1'b1;
		// else if ((DrawX==10'd264)&&(DrawY==10'd72))
		else if ((DrawX > (10'd264 - 10'd2))&&(DrawY > (10'd72 - 10'd2))&&(DrawX <= (10'd264 + 10'd2))&&(DrawY <= (10'd72 + 10'd2))	
			food15_on=1'b1;
		//else if ((DrawX==10'd264)&&(DrawY==10'd120))
		//	food_on=1'b1;
		//else if ((DrawX==10'd264)&&(DrawY==10'd168))
		else if ((DrawX > (10'd264 - 10'd2))&&(DrawY > (10'd168 - 10'd2))&&(DrawX <= (10'd264 + 10'd2))&&(DrawY <= (10'd168 + 10'd2))
			food16_on=1'b1;
		//else if ((DrawX==10'd264)&&(DrawY==10'd216))
		//	food_on=1'b1;
		//else if ((DrawX==10'd264)&&(DrawY==10'd264))
		else if ((DrawX > (10'd264 - 10'd2))&&(DrawY > (10'd264 - 10'd2))&&(DrawX <= (10'd264 + 10'd2))&&(DrawY <= (10'd264 + 10'd2))
			food17_on=1'b1;
		//else if ((DrawX==10'd264)&&(DrawY==10'd312))
		//	food_on=1'b1;
		//else if ((DrawX==10'd264)&&(DrawY==10'd360))
		else if ((DrawX > (10'd264 - 10'd2))&&(DrawY > (10'd360 - 10'd2))&&(DrawX <= (10'd264 + 10'd2))&&(DrawY <= (10'd360 + 10'd2))
			food18_on=1'b1;
		//else if ((DrawX==10'd264)&&(DrawY==10'd408))
		//	food_on=1'b1;
		//else if ((DrawX==10'd264)&&(DrawY==10'd456))
		//	food_on=1'b1;
			
		//else if ((DrawX==10'd312)&&(DrawY==10'd24))
		//	food_on=1'b1;
		//else if ((DrawX==10'd312)&&(DrawY==10'd72))
		//	food_on=1'b1;
		//else if ((DrawX==10'd312)&&(DrawY==10'd120))
		else if ((DrawX > (10'd312 - 10'd2))&&(DrawY > (10'd120 - 10'd2))&&(DrawX <= (10'd312 + 10'd2))&&(DrawY <= (10'd120 + 10'd2))
			food19_on=1'b1;
		//else if ((DrawX==10'd312)&&(DrawY==10'd168))
		//	food_on=1'b1;
		//else if ((DrawX==10'd312)&&(DrawY==10'd216))
		else if ((DrawX > (10'd312 - 10'd2))&&(DrawY > (10'd216 - 10'd2))&&(DrawX <= (10'd312 + 10'd2))&&(DrawY <= (10'd216 + 10'd2))
			food20_on=1'b1;
		//else if ((DrawX==10'd312)&&(DrawY==10'd264))
		//	food_on=1'b1;
		//else if ((DrawX==10'd312)&&(DrawY==10'd312))
		else if ((DrawX > (10'd312 - 10'd2))&&(DrawY > (10'd312 - 10'd2))&&(DrawX <= (10'd312 + 10'd2))&&(DrawY <= (10'd312 + 10'd2))
			food21_on=1'b1;
		//else if ((DrawX==10'd312)&&(DrawY==10'd360))
		//	food_on=1'b1;
		//else if ((DrawX==10'd312)&&(DrawY==10'd408))
		else if ((DrawX > (10'd312 - 10'd2))&&(DrawY > (10'd408 - 10'd2))&&(DrawX <= (10'd312 + 10'd2))&&(DrawY <= (10'd408 + 10'd2))
			food22_on=1'b1;
		//else if ((DrawX==10'd312)&&(DrawY==10'd456))
		//	food_on=1'b1;
			
		// else if ((DrawX==10'd360)&&(DrawY==10'd24))
		//	food_on=1'b1;
		// else if ((DrawX==10'd360)&&(DrawY==10'd72))
		else if ((DrawX > (10'd360 - 10'd2))&&(DrawY > (10'd72 - 10'd2))&&(DrawX <= (10'd360 + 10'd2))&&(DrawY <= (10'd72 + 10'd2))
			food23_on=1'b1;
		//else if ((DrawX==10'd360)&&(DrawY==10'd120))
		//	food_on=1'b1;
		//else if ((DrawX==10'd360)&&(DrawY==10'd168))
		else if ((DrawX > (10'd360 - 10'd2))&&(DrawY > (10'd168 - 10'd2))&&(DrawX <= (10'd360 + 10'd2))&&(DrawY <= (10'd168 + 10'd2))
			food24_on=1'b1;
		//else if ((DrawX==10'd360)&&(DrawY==10'd216))
		//	food_on=1'b1;
		//else if ((DrawX==10'd360)&&(DrawY==10'd264))
		else if ((DrawX > (10'd360 - 10'd2))&&(DrawY > (10'd264 - 10'd2))&&(DrawX <= (10'd360 + 10'd2))&&(DrawY <= (10'd264 + 10'd2))
			food25_on=1'b1;
		//else if ((DrawX==10'd360)&&(DrawY==10'd312))
		//	food_on=1'b1;
		//else if ((DrawX==10'd360)&&(DrawY==10'd360))
		else if ((DrawX > (10'd360 - 10'd2))&&(DrawY > (10'd360 - 10'd2))&&(DrawX <= (10'd360 + 10'd2))&&(DrawY <= (10'd360 + 10'd2))
			food26_on=1'b1;
		//else if ((DrawX==10'd360)&&(DrawY==10'd408))
		//	food_on=1'b1;
		//else if ((DrawX==10'd360)&&(DrawY==10'd456))
		//	food_on=1'b1;
			
		//else if ((DrawX==10'd408)&&(DrawY==10'd24))
		//	food_on=1'b1;
		//else if ((DrawX==10'd408)&&(DrawY==10'd72))
		//	food_on=1'b1;
		//else if ((DrawX==10'd408)&&(DrawY==10'd120))
		else if ((DrawX > (10'd408 - 10'd2))&&(DrawY > (10'd120 - 10'd2))&&(DrawX <= (10'd408 + 10'd2))&&(DrawY <= (10'd120 + 10'd2))
			food27_on=1'b1;
		//else if ((DrawX==10'd408)&&(DrawY==10'd168))
		//	food_on=1'b1;
		//else if ((DrawX==10'd408)&&(DrawY==10'd216))
		else if ((DrawX > (10'd408 - 10'd2))&&(DrawY > (10'd216 - 10'd2))&&(DrawX <= (10'd408 + 10'd2))&&(DrawY <= (10'd216 + 10'd2))
			food28_on=1'b1;
		//else if ((DrawX==10'd408)&&(DrawY==10'd264))
		//	food_on=1'b1;
		//else if ((DrawX==10'd408)&&(DrawY==10'd312))
		else if ((DrawX > (10'd408 - 10'd2))&&(DrawY > (10'd312 - 10'd2))&&(DrawX <= (10'd408 + 10'd2))&&(DrawY <= (10'd312 + 10'd2))
			food29_on=1'b1;
		//else if ((DrawX==10'd408)&&(DrawY==10'd360))
		//	food_on=1'b1;
		//else if ((DrawX==10'd408)&&(DrawY==10'd408))
		else if ((DrawX > (10'd408 - 10'd2))&&(DrawY > (10'd408 - 10'd2))&&(DrawX <= (10'd408 + 10'd2))&&(DrawY <= (10'd408 + 10'd2))
			food30_on=1'b1;
		//else if ((DrawX==10'd408)&&(DrawY==10'd456))
		//	food_on=1'b1;
			
		//else if ((DrawX==10'd456)&&(DrawY==10'd24))
		//	food_on=1'b1;
		//else if ((DrawX==10'd456)&&(DrawY==10'd72))
		else if ((DrawX > (10'd456 - 10'd2))&&(DrawY > (10'd72 - 10'd2))&&(DrawX <= (10'd456 + 10'd2))&&(DrawY <= (10'd72 + 10'd2))
			food31_on=1'b1;
		//else if ((DrawX==10'd456)&&(DrawY==10'd120))
		//	food_on=1'b1;
		//else if ((DrawX==10'd456)&&(DrawY==10'd168))
		else if ((DrawX > (10'd456 - 10'd2))&&(DrawY > (10'd168 - 10'd2))&&(DrawX <= (10'd456 + 10'd2))&&(DrawY <= (10'd168 + 10'd2))
			food32_on=1'b1;
		//else if ((DrawX==10'd456)&&(DrawY==10'd216))
		//	food_on=1'b1;
		// else if ((DrawX==10'd456)&&(DrawY==10'd264))
		else if ((DrawX > (10'd456 - 10'd2))&&(DrawY > (10'd264 - 10'd2))&&(DrawX <= (10'd456 + 10'd2))&&(DrawY <= (10'd264 + 10'd2))
			food33_on=1'b1;
		//else if ((DrawX==10'd456)&&(DrawY==10'd312))
		//	food_on=1'b1;
		//////////////////
		// Special Bean
		// else if ((DrawX==10'd456)&&(DrawY==10'd360))
		else if ((DrawX > (10'd456 - 10'd3))&&(DrawY > (10'd360 - 10'd3))&&(DrawX <= (10'd456 + 10'd3))&&(DrawY <= (10'd360 + 10'd3))
			foodspec3_on=1'b1;
		/////////////////////
		//else if ((DrawX==10'd456)&&(DrawY==10'd408))
		//	food_on=1'b1;
		//else if ((DrawX==10'd456)&&(DrawY==10'd456))
		//	food_on=1'b1;
			
		//else if ((DrawX==10'd504)&&(DrawY==10'd24))
		//	food_on=1'b1;
		//else if ((DrawX==10'd504)&&(DrawY==10'd72))
		//	food_on=1'b1;
		//else if ((DrawX==10'd504)&&(DrawY==10'd120))
		else if ((DrawX > (10'd504 - 10'd2))&&(DrawY > (10'd120 - 10'd2))&&(DrawX <= (10'd504 + 10'd2))&&(DrawY <= (10'd120 + 10'd2))
			food34_on=1'b1;
		//else if ((DrawX==10'd504)&&(DrawY==10'd168))
		//	food_on=1'b1;
		//else if ((DrawX==10'd504)&&(DrawY==10'd216))
		else if ((DrawX > (10'd504 - 10'd2))&&(DrawY > (10'd216 - 10'd2))&&(DrawX <= (10'd504 + 10'd2))&&(DrawY <= (10'd216 + 10'd2))
			food35_on=1'b1;
		//else if ((DrawX==10'd504)&&(DrawY==10'd264))
		//	food_on=1'b1;
		//else if ((DrawX==10'd504)&&(DrawY==10'd312))
		else if ((DrawX > (10'd504 - 10'd2))&&(DrawY > (10'd312 - 10'd2))&&(DrawX <= (10'd504 + 10'd2))&&(DrawY <= (10'd312 + 10'd2))
			food36_on=1'b1;
		//else if ((DrawX==10'd504)&&(DrawY==10'd360))
		//	food_on=1'b1;
		//else if ((DrawX==10'd504)&&(DrawY==10'd408))
		else if ((DrawX > (10'd504 - 10'd2))&&(DrawY > (10'd408 - 10'd2))&&(DrawX <= (10'd504 + 10'd2))&&(DrawY <= (10'd408 + 10'd2))
			food37_on=1'b1;
		//else if ((DrawX==10'd504)&&(DrawY==10'd456))
		//	food_on=1'b1;
			
		//else if ((DrawX==10'd552)&&(DrawY==10'd24))
		//	food_on=1'b1;
		//else if ((DrawX==10'd552)&&(DrawY==10'd72))
		else if ((DrawX > (10'd552 - 10'd2))&&(DrawY > (10'd72 - 10'd2))&&(DrawX <= (10'd552 + 10'd2))&&(DrawY <= (10'd72 + 10'd2))
			food38_on=1'b1;
		//else if ((DrawX==10'd552)&&(DrawY==10'd120))
		//	food_on=1'b1;
		///////////////////////////
		// Special Bean
		//else if ((DrawX==10'd552)&&(DrawY==10'd168))
		else if ((DrawX > (10'd552 - 10'd3))&&(DrawY > (10'd168 - 10'd3))&&(DrawX <= (10'd552 + 10'd3))&&(DrawY <= (10'd168 + 10'd3))
			foodspec4_on=1'b1;
		////////////////////////
		//else if ((DrawX==10'd552)&&(DrawY==10'd216))
		//	food_on=1'b1;
		//else if ((DrawX==10'd552)&&(DrawY==10'd264))
		else if ((DrawX > (10'd552 - 10'd2))&&(DrawY > (10'd264 - 10'd2))&&(DrawX <= (10'd552 + 10'd2))&&(DrawY <= (10'd264 + 10'd2))
			food39_on=1'b1;
		//else if ((DrawX==10'd552)&&(DrawY==10'd312))
		//	food_on=1'b1;
		//else if ((DrawX==10'd552)&&(DrawY==10'd360))
		else if ((DrawX > (10'd552 - 10'd2))&&(DrawY > (10'd360 - 10'd2))&&(DrawX <= (10'd552 + 10'd2))&&(DrawY <= (10'd360 + 10'd2))
			food40_on=1'b1;
		//else if ((DrawX==10'd552)&&(DrawY==10'd408))
		//	food_on=1'b1;
		//else if ((DrawX==10'd552)&&(DrawY==10'd456))
		//	food_on=1'b1;
			
		/*else if ((DrawX==10'd600)&&(DrawY==10'd24))
			food_on=1'b1;
		else if ((DrawX==10'd600)&&(DrawY==10'd72))
			food_on=1'b1;
		else if ((DrawX==10'd600)&&(DrawY==10'd120))
			food_on=1'b1;
		else if ((DrawX==10'd600)&&(DrawY==10'd168))
			food_on=1'b1;
		else if ((DrawX==10'd600)&&(DrawY==10'd216))
			food_on=1'b1;
		else if ((DrawX==10'd600)&&(DrawY==10'd264))
			food_on=1'b1;
		else if ((DrawX==10'd600)&&(DrawY==10'd312))
			food_on=1'b1;
		else if ((DrawX==10'd600)&&(DrawY==10'd360))
			food_on=1'b1;
		else if ((DrawX==10'd600)&&(DrawY==10'd408))
			food_on=1'b1;
		else if ((DrawX==10'd600)&&(DrawY==10'd456))
			food_on=1'b1;
			*/
		else 
			food_on=1'b0;
	end
	always_comb
	begin
		if ((DrawX>10'd22)&&(DrawX<10'd26)&&(DrawY>10'd22)&&(DrawY<10'd458))
			wall_on=1'b1;
		else if ((DrawX>10'd26)&&(DrawX<10'd602)&&(DrawY>10'd22)&&(DrawY<10'd26))
			wall_on=1'b1;
		else if ((DrawX>10'd26)&&(DrawX<10'd602)&&(DrawY>10'd454)&&(DrawY<10'd458))
			wall_on=1'b1;
		else if ((DrawX>10'd598)&&(DrawX<10'd602)&&(DrawY>10'd22)&&(DrawY<10'd458))
			wall_on=1'b1;
		else 
			wall_on=1'b0;
	end
			
		//ADD MORE WALLS ADD MORE WALLS ADD MORE WALLS ADD MORE WALLS ADD MORE WALLS ADD MORE WALLS ADD MORE WALLS ADD MORE WALLS 
		
    always_comb
    begin:RGB_Display
	
	    if ((wall_on == 1'b1)) begin //blue
	    Red = 8'h80;
            Green = 8'h00;
            Blue = 8'h00;
	end   
	
	    else if ((ball_on == 1'b1)) begin //white
            Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
        end       
	    else if ((food_on == 1'b1)) begin //yellow
            Red = 8'hff;
            Green = 8'h55;
            Blue = 8'h00;
        end   
	else begin 
            Red = 8'h00; 
            Green = 8'h00;
            Blue = 8'h7f - DrawX[9:3];
        end      
    end 
    
endmodule
