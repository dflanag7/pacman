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


	
	
module  color_mapper ( input [1:0] a [23:0],
				input        [9:0] BallX, BallY, DrawX, DrawY, Ball_size, 
		       output logic [7:0]  Red, Green, Blue
				 output [1:0] b [23:0]
		     
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
	 int res[$];
	 //keep track of the beans
	 logic wall_on;
	 logic ghost_onr, ghost_onp, ghost_onb;
	 logic [1:0] is_food [23:0];
	 logic [1:0] a [23:0];
	 
	 int special_loc_x[3:0];
	 int special_loc_y[3:0];
	 logic [1:0] is_special [3:0];
	 
	 parameter width_pacman = 20;
	 parameter height_pacman = 20;
	 parameter pacman_file = "pacman2.txt";
	 int pacman_mem_loc;
	 logic pacman_on;
	 logic memory_pac [width_pacman*height_pacman];
	 
	 initial begin
		$readmemb(pacman_file, memory_pac);
	 end
		
	
	
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
		int first_pos = 10'd72;
		int margin = 10'd2; // replace by food_size/2
		int bean_dist = 10'd96;
		
		for (int i = 1; i<= 6; i=i+1) begin
			for (int j = 1; j<= 4; j=j+1) begin
				
				//int food_x = first_pos + (i-1)*bean_dist;
				//int food_y = first_pos + (j-1)*bean_dist;
				
			if ((DrawX > (first_pos + (i-1)*bean_dist - margin)) && (DrawY > (first_pos + (j-1)*bean_dist - margin)) && (DrawX <= (first_pos + (i-1)*bean_dist + margin)) && (DrawY <= (first_pos + (j-1)*bean_dist + margin)))
				is_food[(i-1)*4+j-1] = 1'b1;
			else 
				is_food[(i-1)*4+j-1] = 1'b0;
			
			end
		end
	end

	
always_comb
	begin
		//checking for special beans
		
		int margin_special = 10'd6;
		
		special_loc_x = '{72, 168, 456, 552};
		special_loc_y = '{168, 360, 360, 168};
		
		
		for(int i = 0; i<4; i = i + 1) begin
			
			if ((DrawX > special_loc_x[i] - margin_special) && (DrawX < special_loc_x[i] + margin_special) && (DrawY > special_loc_y[i] - margin_special) && (DrawY < special_loc_y[i] + margin_special))
				is_special[i] = 1'b1;
			else
				is_special[i] = 1'b0;
		end
		
	end
				
	
// Check if food is eaten, a array keeps track of if food is eaten	
				
always_comb
	begin
		int first_pos = 10'd72;
		int margin = 10'd2; // replace by food_size/2
		int bean_dist = 10'd96;
		
		for (int i = 1; i<= 6; i=i+1) begin
			for (int j = 1; j<= 4; j=j+1) begin
				
				//int food_x = first_pos + (i-1)*bean_dist;
				//int food_y = first_pos + (j-1)*bean_dist;
				
			if ((BallX > (first_pos + (i-1)*bean_dist - margin)) && (BallY > (first_pos + (j-1)*bean_dist - margin)) && (BallX <= (first_pos + (i-1)*bean_dist + margin)) && (BallY <= (first_pos + (j-1)*bean_dist + margin)))
				a[(i-1)*4+j-1] = 1'b0; // eaten -> 0
			else 
				a[(i-1)*4+j-1] = 1'b1; // not eaten -> 1
			
			end
		end
	end				
				
				

// copy a into b
always_comb
	begin
			
		for (int i = 1; i<= 6; i=i+1) begin
			for (int j = 1; j<= 4; j=j+1) begin
				b[(i-1)*4+j-1] <= a[(i-1)*4+j-1]
			end
		end
	
	end
				
				
				
				
			
	
	
	//____________________________________________________
	// Wall
	//____________________________________________________
	
	
	
	always_comb
	begin
		
	//boarder
	
		if ((DrawX>10'd22)&&(DrawX<10'd26)&&(DrawY>10'd22)&&(DrawY<10'd458))
			wall_on=1'b1;
		else if ((DrawX>=10'd26)&&(DrawX<10'd602)&&(DrawY>10'd22)&&(DrawY<10'd26))
			wall_on=1'b1;
		else if ((DrawX>=10'd26)&&(DrawX<10'd602)&&(DrawY>10'd454)&&(DrawY<10'd458))
			wall_on=1'b1;
		else if ((DrawX>10'd598)&&(DrawX<10'd602)&&(DrawY>10'd22)&&(DrawY<10'd458))
			wall_on=1'b1;
			
	//maze walls		
			//L shape 1
		else if((DrawX>10'd93)&&(DrawX<10'd98)&&(DrawY>10'd93)&&(DrawY<10'd168))
			wall_on=1'b1;
		else if((DrawY>10'd93)&&(DrawY<10'd98)&&(DrawX>10'd96)&&(DrawX<10'd168))
			wall_on=1'b1;
		
		// L shape 2
		else if((DrawX>10'd93)&&(DrawX<10'd98)&&(DrawY>10'd264)&&(DrawY<10'd387))
			wall_on=1'b1;
		else if((DrawY>10'd382)&&(DrawY<10'd387)&&(DrawX>10'd96)&&(DrawX<10'd168))
			wall_on=1'b1;
		
		// L shape 3
		else if((DrawX>10'd526)&&(DrawX<10'd531)&&(DrawY>10'd93)&&(DrawY<10'd168))
			wall_on=1'b1;
		else if((DrawY>10'd93)&&(DrawY<10'd98)&&(DrawX>10'd456)&&(DrawX<10'd527))
			wall_on=1'b1; 
		
		//L shape 4
		else if((DrawX>10'd526)&&(DrawX<=10'd531)&&(DrawY>10'd264)&&(DrawY<10'd387))
			wall_on=1'b1;
		else if((DrawY>10'd382)&&(DrawY<10'd387)&&(DrawX>10'd456)&&(DrawX<10'd527))
			wall_on=1'b1;					
		else 
			wall_on=1'b0;
	end
	
	
// PACMAN check

always_comb 
	begin
		
		pacman_mem_loc = 0;
		
		if ((DistX >= -width_pacman/2) && (DistX < width_pacman/2) && (DistY >= -height_pacman/2) && (DistY < height_pacman/2))
		begin	
			pacman_on = 1'b1;
			pacman_mem_loc = (DistX + width_pacman/2) + (DistY + height_pacman/2)*width_pacman;
		end
		else
		begin
			pacman_on = 1'b0;
		end
		
	end
			
		
		
    always_comb
    begin:RGB_Display
	
		if ((wall_on == 1'b1))
		begin
			Red = 8'h2e;
         Green = 8'hb9;
         Blue = 8'hf7;
		end   
		
		else if ((pacman_on == 1'b1) && (memory_pac[pacman_mem_loc] == 1'b1)) 
		begin
		   Red = 8'hff;
         Green = 8'h00;
         Blue = 8'h00;
		end
			
//        else if ((ball_on == 1'b1)) 
//        begin 
//            Red = 8'hff;
//            Green = 8'hff;
//            Blue = 8'h00;
//        end    
//		  
		  else if ((is_food.or() == 1'b1))
        begin 
			res = is_food.find(x) with (x == 1'b1)
			if(a[res] == 1'b0)
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
		  
		  else if ((is_special.or() == 1'b1))
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
