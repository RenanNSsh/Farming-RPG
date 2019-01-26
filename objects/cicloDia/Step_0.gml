/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(ord("T"))){ tempo_pausado = !tempo_pausado; }
if(tempo_pausado) exit;


//Incrementar Tempo 
segundos += incremento_tempo;
minutos = segundos/60;
horas = minutos/60;

escuridao = horas/24;

//Checar Ciclo
if(horas >= 24){
	segundos = 0;
	dia++;
	with(plantagem){
		event_perform(ev_other, ev_user1);
	}
	if(dia > 30){
		dia = 1;
		temporada++;
		if(temporada > 4){
			temporada= 1;
			ano++;
		}
	}
}