/// @description Insert description here
// You can write your code in this editor
moveX = 0;
moveY = 0;

var parado = choose(0,1);
if(parado == false){
	var dir = choose(1,2,3,4);
	switch(dir){
		case 1: 
			moveX = -velocidade; 
			break;
		case 2:
			moveX = velocidade;
			break;
		case 3:
			moveY = -velocidade;
			break;
		case 4:
			moveY  = velocidade;
	}
}

alarm[1] = random_range(2.5,4)*room_speed;