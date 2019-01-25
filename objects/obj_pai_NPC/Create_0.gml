/// @description Insert description here
// You can write your code in this editor

vel_caminhando = 1;
vel_normal = 2;
vel_correndo = 3;
velocidade = vel_normal;

x_frame = 1;
y_frame = 11;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

spr_base = -1;
spr_cabelo = -1;
spr_torso = -1;
spr_pes = -1;
spr_sombra = -1;

moveX = 0;
moveY = 0;

alarm[1] = 1;