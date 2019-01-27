/// @description Insert description here
// You can write your code in this editor

depth = -1;
escala = 2;
tamanhoFrame = 32;
mostrarInventario = true;

slot_selecionado = 0;
slot_pegado = -1;

mouse_slotX = 0;
mouse_slotY = 0;

larguraTela = display_get_gui_width();
alturaTela = display_get_gui_height();

inventarioLargura = 288;
inventarioAltura = 192;

xStart = (larguraTela/2) - (inventarioLargura * escala / 2);
yStart = (alturaTela/2) - (inventarioAltura * escala / 2);

inventario_slots = 20;
inventario_slots_altura = 3;
inventario_slots_largura = 8;

x_distancia_slot = 2;
y_distancia_slot = 4;

inventarioUI = spr_inventario_UI;
inventarioItens = spr_inventario_itens;

inventarioItens_colunas = sprite_get_width(inventarioItens)/tamanhoFrame;
inventarioIntens_linhas = sprite_get_height(inventarioItens)/tamanhoFrame;

informacaoPersonagemX = xStart + (9 * escala);
informacaoPersonagemY = yStart + (9 * escala);

slots_x = informacaoPersonagemX;
slots_y = yStart + (40 * escala);

//------INFORMAÇÕES DO PLAYER
//0 = OURO
//1 = PRATA
//2 = BRONZE
//3 = NOME

ds_player_informacao = ds_grid_create(2,4);
var playerInfo = ds_player_informacao;

playerInfo[# 0, 0] = "Ouro";
playerInfo[# 0, 1] = "Prata";
playerInfo[# 0, 2] = "Bronze";
playerInfo[# 0, 3] = "Nome";

playerInfo[# 1, 0] = irandom_range(0,99);
playerInfo[# 1, 1] = irandom_range(0,99);
playerInfo[# 1, 2] = irandom_range(0,99);
playerInfo[# 1, 3] = "Jogador";

//--------INVENTARIO
//0 = ITEM
//1 = NUMERO

ds_inventario = ds_grid_create(2, inventario_slots);

enum item{
	nenhum	       = 0,
	tomate         = 1,
	batata         = 2,
	cenoura        = 3,
	alcachofra     = 4,
	pimenta        = 5,
	pepino         = 6,
	milho          = 7,
	madeira        = 8,
	pedra          = 9,
	balde          = 10,
	cadeira        = 11,
	quadro         = 12,
	machado        = 13,
	pocao          = 14,
	estrela_do_mar = 15,
	cogumelo       = 16,
	pistola        = 17,
	rifle          = 18,
	pistola12      = 19,
	tamanho        = 20
}

for(var yy = 0; yy < inventario_slots;yy++){
	ds_inventario [# 0, yy] = irandom_range(1, item.tamanho - 1);
	ds_inventario [# 1, yy] = irandom_range(1,10);
	
}