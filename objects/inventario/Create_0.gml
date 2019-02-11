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

descricao_x = informacaoPersonagemX;
descricao_y = yStart + (156 * escala);

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
ds_plantasInventario = ds_list_create();
adiciona_lista_plantas();

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
	pistola2       = 19,
	tamanho        = 20
}

indicePlantaSelecionada = 0;

with(plantagem){	
	plantaSelecionada = ds_list_find_value(inventario.ds_plantasInventario,inventario.indicePlantaSelecionada);
}

#region Criar a grade de descrição dos itens

	ds_descricao_itens = ds_grid_create(2, item.tamanho);
	
	//---Nome dos Items
	var coluna = 0, linha = 0;
	ds_descricao_itens[# coluna, linha++] = "Nada";
	ds_descricao_itens[# coluna, linha++] = "Tomate";
	ds_descricao_itens[# coluna, linha++] = "Batata";
	ds_descricao_itens[# coluna, linha++] = "Cenoura";
	ds_descricao_itens[# coluna, linha++] = "Alcachofra";
	ds_descricao_itens[# coluna, linha++] = "Pimenta";
	ds_descricao_itens[# coluna, linha++] = "Pepino";
	ds_descricao_itens[# coluna, linha++] = "Milho";
	ds_descricao_itens[# coluna, linha++] = "Madeira";
	ds_descricao_itens[# coluna, linha++] = "Pedra";
	ds_descricao_itens[# coluna, linha++] = "Balde";
	ds_descricao_itens[# coluna, linha++] = "Cadeira";
	ds_descricao_itens[# coluna, linha++] = "quadro";
	ds_descricao_itens[# coluna, linha++] = "Machado";
	ds_descricao_itens[# coluna, linha++] = "Pocao";
	ds_descricao_itens[# coluna, linha++] = "Estrela do Mar";
	ds_descricao_itens[# coluna, linha++] = "Cogumelo";
	ds_descricao_itens[# coluna, linha++] = "Pistola";
	ds_descricao_itens[# coluna, linha++] = "Rifle";
	ds_descricao_itens[# coluna, linha++] = "Pistola2";
	
	//---Descrição dos itens
	var coluna = 1, linha = 0;
	ds_descricao_itens[# coluna, linha++] = "Vazio.";
	ds_descricao_itens[# coluna, linha++] = "Tomate podre.";
	ds_descricao_itens[# coluna, linha++] = "Nenhum ser humano deveria comer isto.veria comer isto.";
	ds_descricao_itens[# coluna, linha++] = "So coma se for um coelho.";
	ds_descricao_itens[# coluna, linha++] = "Isto dai e uma merda, mermao.";
	ds_descricao_itens[# coluna, linha++] = "LaCu Caracha";
	ds_descricao_itens[# coluna, linha++] = "Una Exception, Una Pepino.";
	ds_descricao_itens[# coluna, linha++] = "Usar isto para pipoca e maravilhoso.";
	ds_descricao_itens[# coluna, linha++] = "Madeira boa pra construir seu barraco.";
	ds_descricao_itens[# coluna, linha++] = "Mantenha longe de viciados.";
	ds_descricao_itens[# coluna, linha++] = "Seu melhor amigo quando ta bebado.";
	ds_descricao_itens[# coluna, linha++] = "Pode usar isto para sentar, ou sentar no chao mesmo.";
	ds_descricao_itens[# coluna, linha++] = "Quadro Magnific.";
	ds_descricao_itens[# coluna, linha++] = "de Assis.";
	ds_descricao_itens[# coluna, linha++] = "Pocao da depressao.";
	ds_descricao_itens[# coluna, linha++] = "Estrela do Maravilho dia.";
	ds_descricao_itens[# coluna, linha++] = "Cogumelo do sol tunado";
	ds_descricao_itens[# coluna, linha++] = "Tu ta Pistola?";
	ds_descricao_itens[# coluna, linha++] = "Rifle AK47, a arma perfeita para o combate.";
	ds_descricao_itens[# coluna, linha++] = "Pistola calibre 12, a arma pesada perfeita se tu quer uma pistola.";

#endregion
