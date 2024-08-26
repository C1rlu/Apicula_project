@tool
extends EditorScript


func _run():
	
	var root = EditorInterface.get_selection().get_selected_nodes()
	var result : Array = []
	var utility = GameUtility.new()
	
	result.append_array(utility.get_all_render(root[0]))
	select_mesh_by_layerMask(result,65536)

func select_mesh_by_layerMask(mesh_array :Array, layer_mask_id : int): #in forma 65536
	
	for mesh in mesh_array:
		if mesh.get_layer_mask() == layer_mask_id:
			mesh.visible = true
		else:
			mesh.visible = true

