/// @description Insert description here
// You can write your code in this editor
if(desenhar_luz){
	var cor = cor_luz;
	draw_set_alpha(escuridao);
	draw_rectangle_color(0,0,larguraGUI,alturaGUI, cor, cor, cor, cor, false);
	draw_set_alpha(1);
}

var cor = c_lime;
draw_text_color(10,10,"segundos: "+ string(segundos), cor, cor, cor, cor, 1);
draw_text_color(10,30,"minutos: "+ string(minutos), cor, cor, cor, cor, 1);
draw_text_color(10,50,"horas: "+ string(horas), cor, cor, cor, cor, 1);
draw_text_color(10,70,"dias: "+ string(dia), cor, cor, cor, cor, 1);
draw_text_color(10,90,"temporadas: "+ string(temporada), cor, cor, cor, cor, 1);
draw_text_color(10,110,"anos: "+ string(ano), cor, cor, cor, cor, 1);