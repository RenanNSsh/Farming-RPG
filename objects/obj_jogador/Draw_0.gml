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

if(x_frame + (anim_velocidade/60) < anim_tamanho){
	x_frame+=anim_velocidade/60;
}else{
	x_frame = 1;
}

//DESENHA A SOMBRA DO PERSONAGEM
draw_sprite(spr_sombra_personagem,0,x,y)

//DESENHA A BASE DO PERSONAGEM
draw_sprite_part(spr_base, 0, floor(x_frame) * frame_tamanho, y_frame * frame_tamanho, frame_tamanho, frame_tamanho, xx,yy);

//DESENHA O CABELO DO PERSONAGEM
draw_sprite_part(spr_cabelo, 0, floor(x_frame) * frame_tamanho, y_frame * frame_tamanho, frame_tamanho, frame_tamanho, xx,yy);

//DESENHA O TORÇO DO PERSONAGEM
draw_sprite_part(spr_torso, 0, floor(x_frame) * frame_tamanho, y_frame * frame_tamanho, frame_tamanho, frame_tamanho, xx,yy);

//DESENHA A PERNA DO PERSONAGEM
draw_sprite_part(spr_pernas, 0, floor(x_frame) * frame_tamanho, y_frame * frame_tamanho, frame_tamanho, frame_tamanho, xx,yy);

//DESENHA O PÉ DO PERSONAGEM
draw_sprite_part(spr_pes, 0, floor(x_frame) * frame_tamanho, y_frame * frame_tamanho, frame_tamanho, frame_tamanho, xx,yy);

//MUDA O FRAME PARA A ANIMAÇÃO



draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_yellow,c_yellow,c_yellow,c_yellow,true);