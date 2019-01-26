/// Colisao do NPC

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

//-----------APLICA MOVIMENTO
x += moveX;
y += moveY;