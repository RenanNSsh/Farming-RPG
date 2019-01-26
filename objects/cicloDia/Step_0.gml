/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(ord("T"))){ tempo_pausado = !tempo_pausado; }
if(tempo_pausado) exit;


//Incrementar Tempo 
segundos += incremento_tempo;
minutos = segundos/60;
horas = minutos/60;

if(desenhar_luz){
	#region Fases e variaveis
		var escuridoes, cores, faseInicio, faseFim;
		if(horas > faseDia.nascer_sol && horas <= faseDia.sol_dia){    //Nascer do sol
			escuridoes = [escuridao_maxima, 0.2];
			cores = [merge_color(c_black,c_navy,0.3), c_orange];
			faseInicio = faseDia.nascer_sol;
			faseFim = faseDia.sol_dia;
		}else if(horas > faseDia.sol_dia && horas <= faseDia.por_sol){ // Dia
			escuridoes = [0.2, 0, 0, 0, 0.2]
			cores = [c_orange, c_orange, c_white, c_orange, c_orange];
			faseInicio = faseDia.sol_dia;
			faseFim = faseDia.por_sol;
		}else if(horas > faseDia.por_sol && horas <= faseDia.noite){   // Por do Sol
			escuridoes = [0.2, escuridao_maxima];
			cores = [c_orange,c_navy,merge_color(c_black,c_navy,0.3)];
			faseInicio = faseDia.por_sol;
			faseFim = faseDia.noite;
		}else{														   // Noite
			escuridoes = [escuridao_maxima];
			cores = [merge_color(c_black,c_navy,0.3)];
			faseInicio = faseDia.noite;
			faseFim = faseDia.nascer_sol;
		}
	#endregion
	
	#region Alterar a escuridão dependendo da fase
		//Cores
		if(faseInicio = faseDia.noite){cor_luz = cores[0];}
		else{
			var intervaloFase = ((horas - faseInicio) / (faseFim - faseInicio));
			var posicaoArrayCores = intervaloFase * (array_length_1d(cores)-1);
			var cor1 = cores[floor(posicaoArrayCores)];
			var cor2 = cores[ceil(posicaoArrayCores)];
		
			cor_luz = merge_color(cor1,cor2,posicaoArrayCores-floor(posicaoArrayCores));
		}
		//Escuridoes
		if(faseInicio = faseDia.noite){escuridao = escuridoes[0];}
		else{
			var posicaoArrayEscuridao = intervaloFase * (array_length_1d(escuridoes)-1);
			var escuridao1 = escuridoes[floor(posicaoArrayEscuridao)];
			var escuridao2 = escuridoes[ceil(posicaoArrayEscuridao)];
	
			escuridao = mescla_numeros(escuridao1,escuridao2,posicaoArrayEscuridao-floor(posicaoArrayEscuridao));
		}
	#endregion
}

#region Checar Ciclo
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
#endregion