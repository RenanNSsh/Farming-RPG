///@description dropar_item
///@arg item_a_dropar
///@arg numero_item
///@arg zerar_slot
///@arg quantidade

var gradeInventario = inventario.ds_inventario;
var item = argument0;
var selecionadoItem = gradeInventario[# 0, item];
var numItem = argument1;
var quantidadeItens = argument3;


gradeInventario[# 1, item] -= quantidadeItens;
//Se for o ultimo do inventario, esvazia
if(gradeInventario[# 1, item] == 0){ 
	gradeInventario[# 0,item] = item.nenhum;
	remove_planta_selecao(numItem-1);
	if(argument2) inventario.slot_pegado = -1;
}

for(var numInstancias = 0; numInstancias<quantidadeItens;numInstancias++){		
	var instancia = instance_create_layer(obj_jogador.x, obj_jogador.y,"Instancias",obj_item);
	with(instancia){
		item_numero = numItem;
		x_frame = item_numero mod (largura_sprite/tamanho_frame);
		y_frame = item_numero div (largura_sprite/tamanho_frame);
	}
}
		
		
#region Cria Notificacao
if(!instance_exists(obj_notificacao)){instance_create_layer(0,0,"Instancias",obj_notificacao);}
					
var numero_item = selecionadoItem;
with(obj_notificacao){
	if(!ds_exists(ds_notificacoes,ds_type_grid)){
		ds_notificacoes = ds_grid_create(2,1);
		var not_grade = ds_notificacoes;
		not_grade[# 0, 0] = -1;
		not_grade[# 1, 0] = inventario.ds_descricao_itens[# 0, numero_item];
	} else{ //Adiciona a grade
		event_perform(ev_other,ev_user0);
							
		var not_grade = ds_notificacoes;
		var linhas_grade = ds_grid_height(not_grade);
		var nomeItem = inventario.ds_descricao_itens[# 0, numero_item];
		var item_na_grade = false;
		for(var linhaAtual =0; linhaAtual< linhas_grade; linhaAtual++){
			if(not_grade[# 1, linhaAtual] == nomeItem ){
				not_grade[# 0, linhaAtual]--;
				item_na_grade = true;
				break;
			}
		}
		if(!item_na_grade){
			ds_grid_resize(not_grade, 2, linhas_grade+1);
			not_grade[# 0, linhas_grade] = -1;
			not_grade[# 1, linhas_grade] = nomeItem;
		}
							
	}
}
#endregion