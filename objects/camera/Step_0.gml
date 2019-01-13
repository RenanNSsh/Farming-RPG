/// @description Insert description here
moverCam = keyboard_check(ord("C"));

if(moverCam){
	x+= (keyboard_check(ord("L")) - keyboard_check(ord("J"))) * 6;
	y+= (keyboard_check(ord("K")) - keyboard_check(ord("I"))) * 6;
}else{
	x = clamp(x, seguindo.x-horizontal_borda, seguindo.x+horizontal_borda);
	y = clamp(y, seguindo.y-vertical_borda, seguindo.y+vertical_borda);
}