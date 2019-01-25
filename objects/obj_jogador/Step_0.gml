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


//-----------CHECAGEM DE COLISÃO

//HORIZONTAL
if(moveX!=0){
	if(place_meeting(x+moveX,y, obj_colisao)){
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
	if(place_meeting(x,y+moveY, obj_colisao)){
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
if(instanciaTransicao != noone) room_goto(instanciaTransicao.roomDestino);

//-----------APLICA MOVIMENTO
x += moveX;
y += moveY;