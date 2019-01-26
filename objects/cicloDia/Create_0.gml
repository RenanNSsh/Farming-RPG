/// @description Insert description here
// You can write your code in this editor

segundos = 0;
minutos = 0;
horas = 0;

dia = 1;
temporada = 1;
ano = 1;

incremento_tempo = 100; //segundos por etapa
tempo_pausado = true;

desenhar_luz = false;

escuridao_maxima = 0.7;
escuridao = 0;
cor_luz = c_black;

larguraGUI = display_get_gui_width();
alturaGUI = display_get_gui_height();

enum faseDia{
	nascer_sol = 6,
	sol_dia = 8.5,
	por_sol = 18,
	noite = 22
}