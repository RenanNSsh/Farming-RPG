/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("P"))) {plantando = !plantando;}


if(plantando){
	mouseX = mouse_x;
	mouseY = mouse_y;
	
	if(mouse_wheel_up()) plantaSelecionada++;
	if(mouse_wheel_down()) plantaSelecionada--;
	
	if(plantaSelecionada<0){
		plantaSelecionada = sprite_get_number(spr_plantagem_pronto)-1;
	}
	if(plantaSelecionada > sprite_get_number(spr_plantagem_pronto)-1){
		plantaSelecionada = 0;
	}
	
	if(mouse_check_button(mb_left)){
		cria_instancia_plantagem(mouseX,mouseY,plantaSelecionada);
	}
}