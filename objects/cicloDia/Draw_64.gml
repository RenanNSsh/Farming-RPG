/// @description Insert description here
// You can write your code in this editor
if(desenhar_luz){
	var cor = cor_luz;
	draw_set_alpha(escuridao);
	draw_rectangle_color(0,0,larguraGUI,alturaGUI, cor, cor, cor, cor, false);
	draw_set_alpha(1);
}

var cor = c_lime;
draw_text_color(10,10, string(segundos), cor, cor, cor, cor, 1);
draw_text_color(10,30, string(minutos), cor, cor, cor, cor, 1);
draw_text_color(10,50, string(horas), cor, cor, cor, cor, 1);
draw_text_color(10,70, string(dia), cor, cor, cor, cor, 1);
draw_text_color(10,90, string(temporada), cor, cor, cor, cor, 1);
draw_text_color(10,110, string(ano), cor, cor, cor, cor, 1);