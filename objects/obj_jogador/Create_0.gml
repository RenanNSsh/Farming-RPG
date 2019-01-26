/// @description Insert description here
// You can write your code in this editor

vel_caminhando = 1;
vel_normal = 2;
vel_correndo = 17;
vel = vel_normal;

x_frame = 1;
y_frame = 11;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

spr_base = spr_base_homem_1;
spr_cabelo = spr_cabelo_homem_1;
spr_torso = spr_torso_homem_1;
spr_pernas = spr_pernas_homem_1;
spr_pes = spr_pes_homem_1;
spr_sombra = spr_sombra_personagem;
spr_perna = spr_pernas_homem_1;

direcaoPersonagem = -1;