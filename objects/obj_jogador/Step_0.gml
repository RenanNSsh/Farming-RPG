/// Movimentação do personagem
// se apertar um botão move o jogador

//-----------ATUALIZA BOTOES
botao_direita = keyboard_check(vk_right) || keyboard_check(ord("D"));
botao_esquerda = keyboard_check(vk_left) || keyboard_check(ord("A"));
botao_cima = keyboard_check(vk_up) || keyboard_check(ord("W"));
botao_baixo = keyboard_check(vk_down) || keyboard_check(ord("S"));
botao_correr = keyboard_check(vk_shift);
botao_andar = keyboard_check(vk_control);

//-----------ALTERA VELOCIDADE
if(botao_correr || botao_andar){
	vel = ((botao_andar*vel_caminhando) + (botao_correr*vel_correndo)) / (botao_correr + botao_andar);
}else{
	vel = vel_normal;
}

//-----------RESETA MOVIMENTO
moveX = 0;
moveY = 0;

//-----------ITENÇÃO DE MOVIMENTO
moveX = (botao_direita - botao_esquerda) * vel;
if(moveX==0) {moveY = (botao_baixo - botao_cima) * vel;}

//PEGA A DIRECAO DO PERSONAGEM
if(moveX!= 0){
	switch(sign(moveX)){
		case 1: direcaoPersonagem = direcao.direita; break;
		case -1: direcaoPersonagem = direcao.esquerda; break;		
	}
}

if(moveY!=0){
	switch(sign(moveY)){
		case 1: direcaoPersonagem = direcao.baixo; break;
		case -1: direcaoPersonagem = direcao.cima; break;
	}
}

if (moveX==0 && moveY == 0){
	direcaoPersonagem = -1;
}

//-----------CHECAGEM DE COLISÃO

//HORIZONTAL
if(moveX!=0){
	var colisaoH = instance_place(x+moveX,y, obj_colisao);
	if(colisaoH != noone && colisaoH.colidivel){
		sinalInversoX = moveX *-1;
		for(moveXTemp = moveX;moveXTemp!=0;moveXTemp+=sign(sinalInversoX)){
			if(!place_meeting(x+moveXTemp,y, obj_colisao)){
				moveX = moveXTemp;
				break;
			}
			moveX = 0;
		}
	}
}

//VERTICAL
if(moveY!=0){
	var colisaoV = instance_place(x,y+moveY, obj_colisao);
	if(colisaoV != noone && colisaoV.colidivel){
		sinalInversoY = moveY *-1;
		for(moveYTemp = moveY;moveYTemp!=0;moveYTemp+=sign(sinalInversoY)){
			if(!place_meeting(x,y+moveYTemp, obj_colisao)){
				moveY = moveYTemp;
				break;
			}
			moveY = 0;
		}
	}
}

//COLISÃO COM OBJETOS
var instanciaTransicao = instance_place(x,y,obj_transicao);
if(instanciaTransicao != noone && direcaoPersonagem == instanciaTransicao.direcaoJogadorAntes) {
	with(game){
		if(!fazerTransicao ){
			spawnRoom = instanciaTransicao.roomDestino;
			spawnX = instanciaTransicao.xDestino;
			spawnY = instanciaTransicao.yDestino;
			spawnJogadorDirecao = instanciaTransicao.direcaoJogadorDepois;
			fazerTransicao = true;
		}
	}
}

//-----------APLICA MOVIMENTO
x += moveX;
y += moveY;