/// Movimentação do personagem
// se apertar um botão move o jogador

//-----------RESETA MOVIMENTO
moveX = 0;
moveY = 0;

//-----------ITENÇÃO DE MOVIMENTO


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

//-----------APLICA MOVIMENTO
x += moveX;
y += moveY;