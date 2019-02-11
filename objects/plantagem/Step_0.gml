/// @description Insert description here
// You can write your code in this editor
if(room != rm_fazenda && room != rm_floresta){
	plantando = false;
	exit;
}

#region Plantanndo

	if(keyboard_check_pressed(ord("P")) && !inventario.mostrarInventario) {plantando = !plantando;}
	
	if(plantando){
		mouseX = mouse_x;
		mouseY = mouse_y;
		var dsPlantaInventario = inventario.ds_plantasInventario
		if(mouse_wheel_up()) inventario.indicePlantaSelecionada++;
		if(mouse_wheel_down())  inventario.indicePlantaSelecionada--;
				
	
		var ultimaPlanta = ds_list_size(dsPlantaInventario)-1;
		if(inventario.indicePlantaSelecionada < 0){
			plantaSelecionada = ds_list_find_value(inventario.ds_plantasInventario,ultimaPlanta);
			inventario.indicePlantaSelecionada = ultimaPlanta;
		}else if(inventario.indicePlantaSelecionada > ultimaPlanta){
			plantaSelecionada = ds_list_find_value(dsPlantaInventario,0);
			inventario.indicePlantaSelecionada = 0;
		}else{
			plantaSelecionada = ds_list_find_value(dsPlantaInventario,inventario.indicePlantaSelecionada);
		}
		
		//Atualiza a lista de Plantas, caso alguma não esteja no inventario
		
		
		
		
		if(!ds_list_empty(dsPlantaInventario)){
			if(mouse_check_button(mb_left)){
				cria_instancia_plantagem(mouseX,mouseY,plantaSelecionada);
			}
		}
	}
#endregion

if(instance_exists(obj_plantagem) && keyboard_check_pressed(ord("G"))){
	with(obj_plantagem){
		if(estagioCrescimento < estagioCrescimentoMaximo){
			idadeDias++;			
			estagioCrescimento = (idadeDias div duracaoEstagioDias);			
		}else{
			estagioCrescimento = estagioCrescimentoMaximo;
			crescidoCompletamente = true;
			if(tipoPlantagem == plantas.milho){
				colidivel = true;
			}
			alarm[1] = 1;
		}
	}
}