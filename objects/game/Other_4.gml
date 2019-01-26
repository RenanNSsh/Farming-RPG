/// @description Insert description here
// You can write your code in this editor
larguraRoom = room_width;
alturaRoom = room_height;


if(spawnRoom == -1) exit;
obj_jogador.x = spawnX;
obj_jogador.y = spawnY;
obj_jogador.direcaoPersonagem = spawnJogadorDirecao;

with(obj_jogador){
	switch(direcaoPersonagem){
		case direcao.esquerda:  y_frame = 9; break;
		case direcao.direita: y_frame = 11; break;
		case direcao.baixo: y_frame = 10; break;
		case direcao.cima: y_frame = 8; break;
		case -1: x_frame = 0; break;
	}
}

