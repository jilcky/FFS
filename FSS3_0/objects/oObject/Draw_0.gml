/// @description 
//arg+=1
	
	var xx;
	var yy;
	switch (Arg) {
	    case 0:
	      xx = 0
		  yy = 0
	        break;
			
			 case 90:
	      xx = 0
		  yy = 0 -32
	        break;
			
			 case 180:
	      xx = 0 -32
		  yy = 0 - 32
	        break;
			
			 case 270:
	      xx = 0 -32
		  yy =0
	        break;
	  
	}
	draw_sprite_ext(SP,0,x-xx ,y-yy,1,1,Arg,c_white,1)
	
	

