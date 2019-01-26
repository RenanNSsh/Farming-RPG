/// @description Insert description here
// You can write your code in this editor
if(fazerTransicao){	
	if(room != spawnRoom){
		blackAlpha +=0.1;
		if(blackAlpha >= 1) {
			room_goto(spawnRoom);
		}
	}else{
		blackAlpha -=0.1;
		if(blackAlpha <= 0)	fazerTransicao = false;
	}
	
	draw_set_alpha(blackAlpha);
	draw_rectangle_colour(0,0,guiLargura,guiAltura,c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1);
}