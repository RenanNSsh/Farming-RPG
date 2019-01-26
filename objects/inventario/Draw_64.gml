/// @description Insert description here
// You can write your code in this editor
if(!mostrarInventario) exit;

//Desenha interface invetario
draw_sprite_part_ext(inventarioUI, 0, tamanhoFrame, 0, inventarioLargura, inventarioAltura, xStart, yStart,escala,escala, c_white, 1);


//desenha nome jogador
var jogadorInfo = ds_player_informacao;
draw_set_font(fnt_texto_24);
var cor = c_black;
draw_text_color(informacaoPersonagemX,informacaoPersonagemY,jogadorInfo[# 0, 3] +": "+ jogadorInfo[# 1, 3],cor,cor,cor,cor,1);

//desenha moedas jogador
draw_set_font(fnt_numeros);
for(var yy=0;yy<3;yy++){
	draw_text_color(informacaoPersonagemX+(195 * escala) +((15+18)*escala*yy),informacaoPersonagemY+5, string(jogadorInfo[# 1, yy]), cor, cor, cor, cor, 1);
}

//----Inventario
