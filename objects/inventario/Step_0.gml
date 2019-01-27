/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("I"))){
	mostrarInventario = !mostrarInventario;
}

if(!mostrarInventario) exit;

#region Mouse por cima
	mouseX = device_mouse_x_to_gui(0);
	mouseY = device_mouse_y_to_gui(0);

	var celulaX_comEspaco = (tamanhoFrame+x_distancia_slot)*escala;
	var celulaY_comEspaco = (tamanhoFrame+y_distancia_slot)*escala;

	var inventario_mouseX = mouseX - slots_x;
	var inventario_mouseY = mouseY  - slots_y;

	var posicaoX = inventario_mouseX div celulaX_comEspaco;
	var posicaoY = inventario_mouseY div celulaY_comEspaco;

	if(posicaoX >= 0 && posicaoX < inventario_slots_largura && posicaoY >= 0 && posicaoY <= inventario_slots_altura){
		var sX = inventario_mouseX - (posicaoX * celulaX_comEspaco);
		var sY = inventario_mouseY - (posicaoY * celulaY_comEspaco);
	
		if((sX	< tamanhoFrame*escala) && (sY < tamanhoFrame * escala)){
			mouse_slotX = posicaoX;
			mouse_slotY = posicaoY;
		}
	}


	slot_selecionado = min(inventario_slots-1,mouse_slotX + (mouse_slotY * inventario_slots_largura)); 
#endregion

var gradeInventario = ds_inventario;
var selecionadoItem = gradeInventario[# 0, slot_selecionado];

if(slot_pegado != -1){
		
	if(mouse_check_button_pressed(mb_left)){
		if(selecionadoItem == item.nenhum){
			// Coloca no slot Vazio
			gradeInventario[# 0, slot_selecionado] = gradeInventario[# 0, slot_pegado];
			gradeInventario[# 1, slot_selecionado] = gradeInventario[# 1, slot_pegado];
			
			gradeInventario[# 0, slot_pegado] = item.nenhum;
			gradeInventario[# 1, slot_pegado] = 0;
			
			slot_pegado = -1;
		}else if(selecionadoItem == gradeInventario[# 0, slot_pegado]){
			// Ajunta os valores dos slots
			if(slot_selecionado != slot_pegado){
				gradeInventario[# 1, slot_selecionado] += gradeInventario[# 1, slot_pegado];
				gradeInventario[# 0, slot_pegado] = item.nenhum;
				gradeInventario[# 1, slot_pegado] = 0;
			}
			slot_pegado = -1;			
		}else {
			//Troca os slots
			var selecionadoItem_num =  gradeInventario[# 1, slot_selecionado];
			gradeInventario[# 0, slot_selecionado] = gradeInventario[# 0, slot_pegado];
			gradeInventario[# 1, slot_selecionado] = gradeInventario[# 1, slot_pegado];
			
			gradeInventario[# 0, slot_pegado] = selecionadoItem;
			gradeInventario[# 1, slot_pegado] =selecionadoItem_num;
			
			
		}
	}
}else if (selecionadoItem != item.nenhum){
	if(mouse_check_button_pressed(mb_left)){
		slot_pegado = slot_selecionado;
	}
}
