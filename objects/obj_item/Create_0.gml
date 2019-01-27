/// @description Insert description here
// You can write your code in this editor

event_inherited();

tamanho_frame = 32;
item_sprite = spr_inventario_itens;
largura_sprite = sprite_get_width(item_sprite);
altura_sprite = sprite_get_height(item_sprite);

item_numero = -1;
x_frame = 0;
y_frame = 0;

x_offset = tamanho_frame / 2;
y_offset = tamanho_frame * (2/3);

movimentacao_drop = true;
var itemdirecao = irandom_range(0,259);
var raio = 32;
destino_x = x + lengthdir_x(raio, itemdirecao);
destino_y = y + lengthdir_y(raio, itemdirecao);