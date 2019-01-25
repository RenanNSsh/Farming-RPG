/// @description Insert description here
// You can write your code in this editor
var anim_tamanho = 9;
var frame_tamanho = 64;
var anim_velocidade = 12;

if(moveX<0) { y_frame = 9; }
else if(moveX>0) { y_frame = 11; }
else if(moveY>0) { y_frame = 10; }
else if(moveY<0) { y_frame = 8; }
else { x_frame = 0; }

var xx = x-x_offset;
var yy = y-y_offset;

//DESENHA A SOMBRA DO PERSONAGEM
if(spr_sombra != -1) draw_sprite(spr_sombra,0,x,y)

//DESENHA A BASE DO PERSONAGEM
if(spr_base != -1) draw_sprite_part(spr_base, 0, floor(x_frame) * frame_tamanho, y_frame * frame_tamanho, frame_tamanho, frame_tamanho, xx,yy);

//DESENHA O CABELO DO PERSONAGEM
if(spr_cabelo != -1) draw_sprite_part(spr_cabelo, 0, floor(x_frame) * frame_tamanho, y_frame * frame_tamanho, frame_tamanho, frame_tamanho, xx,yy);

//DESENHA O TORÇO DO PERSONAGEM
if(spr_torso != -1) draw_sprite_part(spr_torso, 0, floor(x_frame) * frame_tamanho, y_frame * frame_tamanho, frame_tamanho, frame_tamanho, xx,yy);

//DESENHA A PERNA DO PERSONAGEM

//DESENHA O PÉ DO PERSONAGEM
if(spr_pes != -1) draw_sprite_part(spr_pes, 0, floor(x_frame) * frame_tamanho, y_frame * frame_tamanho, frame_tamanho, frame_tamanho, xx,yy);

//MUDA O FRAME PARA A ANIMAÇÃO

if(x_frame < anim_tamanho -1){
	x_frame+=anim_velocidade/60;
}else{
	x_frame = 1;
}

draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_yellow,c_yellow,c_yellow,c_yellow,true);