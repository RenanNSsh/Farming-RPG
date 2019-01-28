///@description dropar_item
///@arg item_a_dropar
///@arg numero_item
///@arg zerar_slot

var gradeInventario = inventario.ds_inventario;
var item = argument0;
var selecionadoItem = gradeInventario[# 0, item];

gradeInventario[# 1, item]--;
//Se for o ultimo do inventario, esvazia
if(gradeInventario[# 1, item] == 0){ 
	gradeInventario[# 0,item] = item.nenhum;
	if(argument2) inventario.slot_pegado = -1;
}

		
var instancia = instance_create_layer(obj_jogador.x, obj_jogador.y,"Instancias",obj_item);
with(instancia){
	item_numero = argument1;
	x_frame = item_numero mod (largura_sprite/tamanho_frame);
	y_frame = item_numero div (largura_sprite/tamanho_frame);
}
		
show_debug_message("Dropou algo")