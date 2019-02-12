/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("I"))){
	mostrarInventario = !mostrarInventario;
	if(plantagem.plantando) plantagem.plantando = false;
}

if(!mostrarInventario) exit;

#region Mouse no inventario

	#region Cálculos de posicionamento
		dentro_display_inventario = true;
		mouseX = device_mouse_x_to_gui(0);
		mouseY = device_mouse_y_to_gui(0);
		
		var dentro_display_inventario = mouseX>xStart && mouseX<xStart+(inventarioLargura*escala) && mouseY>yStart && mouseY<yStart+(inventarioAltura*escala);
	
		var celulaX_comEspaco = (tamanhoFrame+x_distancia_slot)*escala;
		var celulaY_comEspaco = (tamanhoFrame+y_distancia_slot)*escala;
	
		var inventario_mouseX = mouseX - slots_x;
		var inventario_mouseY = mouseY  - slots_y;
	
		var posicaoX = inventario_mouseX div celulaX_comEspaco;
		var posicaoY = inventario_mouseY div celulaY_comEspaco;	
		
		if(inventario_mouseX < 0) posicaoX = -1;
		if(inventario_mouseY < 0) posicaoY = -1;
	#endregion
	
	var mouse_dentro_inventario = posicaoX >= 0 && posicaoX < inventario_slots_largura && posicaoY >= 0 && posicaoY < inventario_slots_altura;
	var indexSelecionado = 0;
	if(mouse_dentro_inventario){
		
		#region Posicionamento dentro do frame
				var mouseX_relativo_ao_item = inventario_mouseX - (posicaoX * celulaX_comEspaco);
				var mouseY_relativo_ao_item = inventario_mouseY - (posicaoY * celulaY_comEspaco);	
		#endregion
		
		var estaDentroFrame = (mouseX_relativo_ao_item	< tamanhoFrame*escala) && (mouseY_relativo_ao_item < tamanhoFrame * escala)
		if(estaDentroFrame){
			//Seleciona o slot			
			mouse_slotX = posicaoX;
			mouse_slotY = posicaoY;
		}else{
			//Zera a seleção
			mouse_slotX = -1;
			mouse_slotY = -1;
		}
		
		indexSelecionado = mouse_slotX +  (mouse_slotY * inventario_slots_largura);
		//show_debug_message("Index selecionado: "+string(indexSelecionado))
		if(indexSelecionado >= inventario_slots) slot_selecionado = -1;
		else slot_selecionado = min(inventario_slots-1,indexSelecionado);
	}else{
		slot_selecionado = -1;
	}
	
	
	
	
#endregion

var gradeInventario = ds_inventario;
var selecionadoItem = gradeInventario[# 0, slot_selecionado];
var algumItemSelecionado = slot_pegado != -1
var slotSelecionadoExiste = indexSelecionado>=0 && indexSelecionado< inventario_slots;

if(algumItemSelecionado && slotSelecionadoExiste){		
	if(mouse_check_button_pressed(mb_left)){		
		if(!dentro_display_inventario){
			#region dropar um do inventario
				var pegado_item = gradeInventario[# 0, slot_pegado];
				dropar_item(slot_pegado,pegado_item,true,1);
			#endregion
		}else if(selecionadoItem == item.nenhum){
			#region coloca da mão para o inventario
				gradeInventario[# 0, slot_selecionado] = gradeInventario[# 0, slot_pegado];
				gradeInventario[# 1, slot_selecionado] = gradeInventario[# 1, slot_pegado];
			
				gradeInventario[# 0, slot_pegado] = item.nenhum;
				gradeInventario[# 1, slot_pegado] = 0;
			
				slot_pegado = -1;
			#endregion
		}else if(selecionadoItem == gradeInventario[# 0, slot_pegado]){
			#region acumula o item
				if(slot_selecionado != slot_pegado){
					gradeInventario[# 1, slot_selecionado] += gradeInventario[# 1, slot_pegado];
					gradeInventario[# 0, slot_pegado] = item.nenhum;
					gradeInventario[# 1, slot_pegado] = 0;
				}
				slot_pegado = -1;	
			#endregion
		}else if(indexSelecionado < inventario_slots && mouse_dentro_inventario){
			#region troca os itens
				var selecionadoItem_num =  gradeInventario[# 1, slot_selecionado];
				gradeInventario[# 0, slot_selecionado] = gradeInventario[# 0, slot_pegado];
				gradeInventario[# 1, slot_selecionado] = gradeInventario[# 1, slot_pegado];
			
				gradeInventario[# 0, slot_pegado] = selecionadoItem;
				gradeInventario[# 1, slot_pegado] =selecionadoItem_num;	
			#endregion
		}
	}else if (mouse_check_button_pressed(mb_right)  && !dentro_display_inventario){
		if(!mouse_dentro_inventario){
			#region dropar todos os itens
				var quantidadeItens = gradeInventario[# 1, slot_pegado];
				var pegado_item = gradeInventario[# 0, slot_pegado];
				dropar_item(slot_pegado,pegado_item,true,quantidadeItens);
			#endregion
		}
	}
}else if (selecionadoItem != item.nenhum && slotSelecionadoExiste){
	if(mouse_check_button_pressed(mb_left)){
		slot_pegado = slot_selecionado;
	}
	
	//Dropa o item ao mundo do jogo
	if(mouse_check_button_pressed(mb_middle) && dentro_display_inventario){
		dropar_item(slot_selecionado,selecionadoItem,false,1);
	}
}

