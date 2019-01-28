/// @description Insert description here
// You can write your code in this editor

if(movimentacao_drop){
	x = lerp(x, destino_x, 0.1);
	y = lerp(y, destino_y, 0.1);
	if( abs(x - destino_x) < 1 && abs(y - destino_y) < 1){
		movimentacao_drop = false;
	}
} else{
	if(!keyboard_check(ord("F"))) exit;
	var xPersonagem = obj_jogador.x;
	var yPersonagem = obj_jogador.y;
	var raio = 32;
	if( point_in_rectangle( xPersonagem, yPersonagem, x-raio,y-raio,x+raio,y+raio)){
		
		//Esta no topo do jogador?
		raio = 2;
		if (!point_in_rectangle( xPersonagem, yPersonagem, x-raio,y-raio,x+raio,y+raio)){
			//Move na direcao do jogador
			x = lerp(x, xPersonagem, 0.1);
			y = lerp(y, yPersonagem, 0.1);
		}else{
			//pega o item
			var numero_item = item_numero;
					
			with(inventario){		
				var pegado = false;
				var dsInventario = ds_inventario;
				//checa se o item já existe no inventario
				for(var yy=0; yy< inventario_slots;yy++){
					if(dsInventario[# 0, yy] == numero_item) {
						dsInventario[# 1, yy]+=1;
						pegado = true;
						break;
					}					
				}
				
				//adiciona o item para um slot vazio se houver
				if(!pegado){
					for(var yy=0; yy< inventario_slots;yy++){
						if(dsInventario[# 0, yy] == item.nenhum) {
							dsInventario[# 0, yy] = numero_item;
							dsInventario[# 1, yy] += 1;
							var dsPlantasInventario = inventario.ds_plantasInventario;
							if(numero_item <= item.tamanho) {
								ds_list_add(dsPlantasInventario, numero_item-1);
								plantagem.plantaSelecionada = -1;
							}
							pegado = true;
							break;
						}					
					}
				}	
			}			
			if(pegado){
				instance_destroy();
				show_debug_message("Item pegado");
			}
		}
		
	}
		
	
}

