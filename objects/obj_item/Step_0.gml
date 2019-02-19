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
							if(numero_item <= plantas.tamanho) {
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
				#region Cria Notificacao
					if(!instance_exists(obj_notificacao)){instance_create_layer(0,0,"Instancias",obj_notificacao);}
					
					var numero_item = item_numero;
					with(obj_notificacao){
						if(!ds_exists(ds_notificacoes,ds_type_grid)){
							ds_notificacoes = ds_grid_create(2,1);
							var not_grade = ds_notificacoes;
							not_grade[# 0, 0] = 1;
							not_grade[# 1, 0] = inventario.ds_descricao_itens[# 0, numero_item];
						} else{ //Adiciona a grade
							event_perform(ev_other,ev_user0);
							
							var not_grade = ds_notificacoes;
							var linhas_grade = ds_grid_height(not_grade);
							var nomeItem = inventario.ds_descricao_itens[# 0, numero_item];
							var item_na_grade = false;
							for(var linhaAtual =0; linhaAtual< linhas_grade; linhaAtual++){
								if(not_grade[# 1, linhaAtual] == nomeItem ){
									not_grade[# 0, linhaAtual]++;
									item_na_grade = true;
									break;
								}
							}
							if(!item_na_grade){
								ds_grid_resize(not_grade, 2, linhas_grade+1);
								not_grade[# 0, linhas_grade] = 1;
								not_grade[# 1, linhas_grade] = nomeItem;
							}
							
						}
					}
				#endregion
				
				instance_destroy();
				show_debug_message("Item pegado");
			}
		}
		
	}
		
	
}

