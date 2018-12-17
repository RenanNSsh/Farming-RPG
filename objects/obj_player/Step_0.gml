/// @description Insert description here
// Mover o jogador ao apertar teclas

apertado_direita = keyboard_check(vk_right) || keyboard_check(ord("D"));
apertado_esquerda = keyboard_check(vk_left) || keyboard_check(ord("A"));
apertado_cima = keyboard_check(vk_up) || keyboard_check(ord("W"));
apertado_baixo = keyboard_check(vk_down) || keyboard_check(ord("S"));
apertado_correr = keyboard_check(vk_shift);
apertado_andar = keyboard_check(vk_control);

//--------Reseta as variaveis de movimento 
moveX = 0;
moveY = 0;

//----- Pretenção de Movimentação
moveX = (apertado_direita - apertado_esquerda) * velocidade;
if (moveX==0){
	moveY = (apertado_baixo - apertado_cima) * velocidade;
}

//------ Alterar Velocidade
if(apertado_correr || apertado_andar){
	velocidade = abs( (apertado_correr * velocidade_correndo) - (apertado_andar * velocidade_andando));
}else{
	velocidade = velocidade_normal;
}

// --------------- CHECAGEM COLISÃO
//Horizontal
if(moveX != 0){
	vai_colidirHorizontal = place_meeting(x+moveX,y,obj_colisao);
	if(vai_colidirHorizontal){
		repeat(abs(moveX)){
			if(!place_meeting(x+sign(moveX),y,obj_colisao)){
				x += sign(moveX); 
			}else{ 
				break; 
			}
		}
		moveX=0;
	}
}

//Vertical
if(moveY != 0){
	vai_colidirVertical = place_meeting(x,y+moveY,obj_colisao);
	if(vai_colidirVertical){
		repeat(abs(moveY)){
			if(!place_meeting(x,y+sign(moveY),obj_colisao)){
				y += sign(moveY);
			}else{
				break;
			}
		}
		moveY=0;
	}
}

x += moveX;
y +=moveY;