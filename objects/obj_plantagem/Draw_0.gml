/// @description Insert description here
// You can write your code in this editor

draw_sprite_part(spr_plantagem,0,estagioCrescimento*larguraFrame,tipoPlantagem*alturaFrame,larguraFrame,alturaFrame,xx,yy);
if(particula >= 0){
	draw_sprite(spr_particula,particula, x+2,y-10);
	particula += .1;
	if(particula >= sprite_get_number(spr_particula)){
		particula = -1;
		alarm[1] = random_range(4,5)*room_speed;
	}
}