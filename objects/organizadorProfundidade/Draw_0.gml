/// @description Insert description here
// You can write your code in this editor

//Muda o tamanho da grade
var numeroInstancias = instance_number(par_ObjetoProfundidade);
var profundidadeGrade = ds_gradeProfundidade;

ds_grid_resize(profundidadeGrade, 2, numeroInstancias);

//Adiciona instâncias para grande
var slot = 0;	with(par_ObjetoProfundidade){	
	profundidadeGrade[# 0, slot] = id;
	profundidadeGrade[# 1, slot] = y;
	slot++;
}

//Organiza a grade em ordem crescente
ds_grid_sort(profundidadeGrade, 1, true);

//Loop pela grade para desenhar todas as instancias

var instancia;
for(var yy=0;yy < numeroInstancias;yy++){
	//pegar um ID
	instancia = profundidadeGrade[# 0, yy];
	
	//Auto desenhar
	with(instancia){
		event_perform(ev_draw,0);
	}
}