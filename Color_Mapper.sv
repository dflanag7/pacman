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
                       output logic [7:0]  Red, Green, Blue );
    
    logic ball_on;
	 logic food_on;
	 logic wall_on;
	 
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
		
			
		if ((DrawX==10'd72)&&(DrawY==10'd24))
			food_on=1'b1;
		else if ((DrawX==10'd72)&&(DrawY==10'd72))
			food_on=1'b1;
		else if ((DrawX==10'd72)&&(DrawY==10'd120))
			food_on=1'b1;
		else if ((DrawX==10'd72)&&(DrawY==10'd168))
			food_on=1'b1;
		else if ((DrawX==10'd72)&&(DrawY==10'd216))
			food_on=1'b1;
		else if ((DrawX==10'd72)&&(DrawY==10'd264))
			food_on=1'b1;
		else if ((DrawX==10'd72)&&(DrawY==10'd312))
			food_on=1'b1;
		else if ((DrawX==10'd72)&&(DrawY==10'd360))
			food_on=1'b1;
		else if ((DrawX==10'd72)&&(DrawY==10'd408))
			food_on=1'b1;
		else if ((DrawX==10'd72)&&(DrawY==10'd456))
			food_on=1'b1;
			
		else if ((DrawX==10'd120)&&(DrawY==10'd24))
			food_on=1'b1;
		else if ((DrawX==10'd120)&&(DrawY==10'd72))
			food_on=1'b1;
		else if ((DrawX==10'd120)&&(DrawY==10'd120))
			food_on=1'b1;
		else if ((DrawX==10'd120)&&(DrawY==10'd168))
			food_on=1'b1;
		else if ((DrawX==10'd120)&&(DrawY==10'd216))
			food_on=1'b1;
		else if ((DrawX==10'd120)&&(DrawY==10'd264))
			food_on=1'b1;
		else if ((DrawX==10'd120)&&(DrawY==10'd312))
			food_on=1'b1;
		else if ((DrawX==10'd120)&&(DrawY==10'd360))
			food_on=1'b1;
		else if ((DrawX==10'd120)&&(DrawY==10'd408))
			food_on=1'b1;
		else if ((DrawX==10'd120)&&(DrawY==10'd456))
			food_on=1'b1;
			
		else if ((DrawX==10'd168)&&(DrawY==10'd24))
			food_on=1'b1;
		else if ((DrawX==10'd168)&&(DrawY==10'd72))
			food_on=1'b1;
		else if ((DrawX==10'd168)&&(DrawY==10'd120))
			food_on=1'b1;
		else if ((DrawX==10'd168)&&(DrawY==10'd168))
			food_on=1'b1;
		else if ((DrawX==10'd168)&&(DrawY==10'd216))
			food_on=1'b1;
		else if ((DrawX==10'd168)&&(DrawY==10'd264))
			food_on=1'b1;
		else if ((DrawX==10'd168)&&(DrawY==10'd312))
			food_on=1'b1;
		else if ((DrawX==10'd168)&&(DrawY==10'd360))
			food_on=1'b1;
		else if ((DrawX==10'd168)&&(DrawY==10'd408))
			food_on=1'b1;
		else if ((DrawX==10'd168)&&(DrawY==10'd456))
			food_on=1'b1;
			
		else if ((DrawX==10'd216)&&(DrawY==10'd24))
			food_on=1'b1;
		else if ((DrawX==10'd216)&&(DrawY==10'd72))
			food_on=1'b1;
		else if ((DrawX==10'd216)&&(DrawY==10'd120))
			food_on=1'b1;
		else if ((DrawX==10'd216)&&(DrawY==10'd168))
			food_on=1'b1;
		else if ((DrawX==10'd216)&&(DrawY==10'd216))
			food_on=1'b1;
		else if ((DrawX==10'd216)&&(DrawY==10'd264))
			food_on=1'b1;
		else if ((DrawX==10'd216)&&(DrawY==10'd312))
			food_on=1'b1;
		else if ((DrawX==10'd216)&&(DrawY==10'd360))
			food_on=1'b1;
		else if ((DrawX==10'd216)&&(DrawY==10'd408))
			food_on=1'b1;
		else if ((DrawX==10'd216)&&(DrawY==10'd456))
			food_on=1'b1;
			
		else if ((DrawX==10'd264)&&(DrawY==10'd24))
			food_on=1'b1;
		else if ((DrawX==10'd264)&&(DrawY==10'd72))
			food_on=1'b1;
		else if ((DrawX==10'd264)&&(DrawY==10'd120))
			food_on=1'b1;
		else if ((DrawX==10'd264)&&(DrawY==10'd168))
			food_on=1'b1;
		else if ((DrawX==10'd264)&&(DrawY==10'd216))
			food_on=1'b1;
		else if ((DrawX==10'd264)&&(DrawY==10'd264))
			food_on=1'b1;
		else if ((DrawX==10'd264)&&(DrawY==10'd312))
			food_on=1'b1;
		else if ((DrawX==10'd264)&&(DrawY==10'd360))
			food_on=1'b1;
		else if ((DrawX==10'd264)&&(DrawY==10'd408))
			food_on=1'b1;
		else if ((DrawX==10'd264)&&(DrawY==10'd456))
			food_on=1'b1;
			
		else if ((DrawX==10'd312)&&(DrawY==10'd24))
			food_on=1'b1;
		else if ((DrawX==10'd312)&&(DrawY==10'd72))
			food_on=1'b1;
		else if ((DrawX==10'd312)&&(DrawY==10'd120))
			food_on=1'b1;
		else if ((DrawX==10'd312)&&(DrawY==10'd168))
			food_on=1'b1;
		else if ((DrawX==10'd312)&&(DrawY==10'd216))
			food_on=1'b1;
		else if ((DrawX==10'd312)&&(DrawY==10'd264))
			food_on=1'b1;
		else if ((DrawX==10'd312)&&(DrawY==10'd312))
			food_on=1'b1;
		else if ((DrawX==10'd312)&&(DrawY==10'd360))
			food_on=1'b1;
		else if ((DrawX==10'd312)&&(DrawY==10'd408))
			food_on=1'b1;
		else if ((DrawX==10'd312)&&(DrawY==10'd456))
			food_on=1'b1;
			
		else if ((DrawX==10'd360)&&(DrawY==10'd24))
			food_on=1'b1;
		else if ((DrawX==10'd360)&&(DrawY==10'd72))
			food_on=1'b1;
		else if ((DrawX==10'd360)&&(DrawY==10'd120))
			food_on=1'b1;
		else if ((DrawX==10'd360)&&(DrawY==10'd168))
			food_on=1'b1;
		else if ((DrawX==10'd360)&&(DrawY==10'd216))
			food_on=1'b1;
		else if ((DrawX==10'd360)&&(DrawY==10'd264))
			food_on=1'b1;
		else if ((DrawX==10'd360)&&(DrawY==10'd312))
			food_on=1'b1;
		else if ((DrawX==10'd360)&&(DrawY==10'd360))
			food_on=1'b1;
		else if ((DrawX==10'd360)&&(DrawY==10'd408))
			food_on=1'b1;
		else if ((DrawX==10'd360)&&(DrawY==10'd456))
			food_on=1'b1;
			
		else if ((DrawX==10'd408)&&(DrawY==10'd24))
			food_on=1'b1;
		else if ((DrawX==10'd408)&&(DrawY==10'd72))
			food_on=1'b1;
		else if ((DrawX==10'd408)&&(DrawY==10'd120))
			food_on=1'b1;
		else if ((DrawX==10'd408)&&(DrawY==10'd168))
			food_on=1'b1;
		else if ((DrawX==10'd408)&&(DrawY==10'd216))
			food_on=1'b1;
		else if ((DrawX==10'd408)&&(DrawY==10'd264))
			food_on=1'b1;
		else if ((DrawX==10'd408)&&(DrawY==10'd312))
			food_on=1'b1;
		else if ((DrawX==10'd408)&&(DrawY==10'd360))
			food_on=1'b1;
		else if ((DrawX==10'd408)&&(DrawY==10'd408))
			food_on=1'b1;
		else if ((DrawX==10'd408)&&(DrawY==10'd456))
			food_on=1'b1;
			
		else if ((DrawX==10'd456)&&(DrawY==10'd24))
			food_on=1'b1;
		else if ((DrawX==10'd456)&&(DrawY==10'd72))
			food_on=1'b1;
		else if ((DrawX==10'd456)&&(DrawY==10'd120))
			food_on=1'b1;
		else if ((DrawX==10'd456)&&(DrawY==10'd168))
			food_on=1'b1;
		else if ((DrawX==10'd456)&&(DrawY==10'd216))
			food_on=1'b1;
		else if ((DrawX==10'd456)&&(DrawY==10'd264))
			food_on=1'b1;
		else if ((DrawX==10'd456)&&(DrawY==10'd312))
			food_on=1'b1;
		else if ((DrawX==10'd456)&&(DrawY==10'd360))
			food_on=1'b1;
		else if ((DrawX==10'd456)&&(DrawY==10'd408))
			food_on=1'b1;
		else if ((DrawX==10'd456)&&(DrawY==10'd456))
			food_on=1'b1;
			
		else if ((DrawX==10'd504)&&(DrawY==10'd24))
			food_on=1'b1;
		else if ((DrawX==10'd504)&&(DrawY==10'd72))
			food_on=1'b1;
		else if ((DrawX==10'd504)&&(DrawY==10'd120))
			food_on=1'b1;
		else if ((DrawX==10'd504)&&(DrawY==10'd168))
			food_on=1'b1;
		else if ((DrawX==10'd504)&&(DrawY==10'd216))
			food_on=1'b1;
		else if ((DrawX==10'd504)&&(DrawY==10'd264))
			food_on=1'b1;
		else if ((DrawX==10'd504)&&(DrawY==10'd312))
			food_on=1'b1;
		else if ((DrawX==10'd504)&&(DrawY==10'd360))
			food_on=1'b1;
		else if ((DrawX==10'd504)&&(DrawY==10'd408))
			food_on=1'b1;
		else if ((DrawX==10'd504)&&(DrawY==10'd456))
			food_on=1'b1;
			
		else if ((DrawX==10'd552)&&(DrawY==10'd24))
			food_on=1'b1;
		else if ((DrawX==10'd552)&&(DrawY==10'd72))
			food_on=1'b1;
		else if ((DrawX==10'd552)&&(DrawY==10'd120))
			food_on=1'b1;
		else if ((DrawX==10'd552)&&(DrawY==10'd168))
			food_on=1'b1;
		else if ((DrawX==10'd552)&&(DrawY==10'd216))
			food_on=1'b1;
		else if ((DrawX==10'd552)&&(DrawY==10'd264))
			food_on=1'b1;
		else if ((DrawX==10'd552)&&(DrawY==10'd312))
			food_on=1'b1;
		else if ((DrawX==10'd552)&&(DrawY==10'd360))
			food_on=1'b1;
		else if ((DrawX==10'd552)&&(DrawY==10'd408))
			food_on=1'b1;
		else if ((DrawX==10'd552)&&(DrawY==10'd456))
			food_on=1'b1;
			
		else if ((DrawX==10'd600)&&(DrawY==10'd24))
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
	
			if ((wall_on == 1'b1))
			
			begin
				Red = 8'h80;
            Green = 8'h00;
            Blue = 8'h00;
			end   
	
        else if ((ball_on == 1'b1)) 
        begin 
            Red = 8'hff;
            Green = 8'hff;
            Blue = 8'hff;
        end       
        else if ((food_on == 1'b1)) 
		  begin 
            Red = 8'hff;
            Green = 8'h55;
            Blue = 8'h00;
        end   
		  else 
		  begin 
            Red = 8'h00; 
            Green = 8'h00;
            Blue = 8'h7f - DrawX[9:3];
        end      
    end 
    
endmodule
