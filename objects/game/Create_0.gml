/// @description Insert description here
// You can write your code in this editor

randomize();
room_goto_next();

debug = false;

guiLargura = display_get_gui_width();
guiAltura = display_get_gui_height();
blackAlpha = 0;

spawnRoom = -1;
fazerTransicao = false;
spawnX = 0;
spawnY = 0;
spawnJogadorDirecao = -1;

enum direcao{
	direita = 0,
	cima = 90,
	esquerda = 180,
	baixo = 270,	
}

