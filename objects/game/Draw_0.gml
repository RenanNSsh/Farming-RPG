/// @description Insert description here
// You can write your code in this editor
if(!debug) exit; 

with(obj_colisao){
	draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_yellow,c_yellow,c_yellow,c_yellow,true);
}
with(obj_jogador){
	draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_yellow,c_yellow,c_yellow,c_yellow,true);
}
with(obj_transicao){
	draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red,c_red,c_red,c_red,true);
}

var xx =0;
var tamanhoFrame = plantagem.tamanhoFrame;

draw_set_alpha(0.3);

var framesHorizontal = larguraRoom div tamanhoFrame;
repeat(framesHorizontal){
	draw_line_color(xx,0,xx,alturaRoom,c_white,c_white);
	xx += tamanhoFrame
}

var yy =0;
var framesvertical = alturaRoom div tamanhoFrame;
repeat(framesvertical){
	draw_line_color(0,yy,larguraRoom,yy,c_white,c_white);
	yy += tamanhoFrame
}

draw_set_alpha(1);