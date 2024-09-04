extends Node

@export var root : Node3D
@export var Movable : Node3D
@export var Movable_node : Node

var list_of_selection_data : Array[selection_data]

const MOVING_OBJECT : Material = preload("res://00_SCENE/Board_control_object_test/Material/moving_object_dither.tres")
const MOVING_OVERLAP_OBJECT : Material = preload("res://00_SCENE/Board_control_object_test/Material/overlaping_object_dither.tres")

func _ready():
	
	if Movable:
		Movable.select_render_state.connect(ini_selection)
	if Movable_node:
		Movable_node.select_render_state.connect(ini_selection)
		
	var utility = GameUtility.new()
	list_of_selection_data.append_array(utility.archive_materials(root))
	


func ini_selection(index_state : int):

	if index_state == 0:
		restore_original_materials()

	if index_state == 1:
		set_all_material(MOVING_OBJECT)
	if index_state == 2:
		set_all_material(MOVING_OVERLAP_OBJECT)
		
		
func set_all_material(material : Material):
	
	for selection in list_of_selection_data:
		var render_mesh = selection.render_mesh
		
		if render_mesh.mesh:
			#render_mesh.set_layer_mask_value(17,true)
			#render_mesh.set_layer_mask_value(2,false)
			for i in range(render_mesh.mesh.get_surface_count()):
				render_mesh.set_surface_override_material(i, material)

func restore_original_materials():
	for selection in list_of_selection_data:
		var render_mesh = selection.render_mesh
		var materials = selection.render_material
		#render_mesh.set_layer_mask_value(17,false)
		#render_mesh.set_layer_mask_value(2,true)
		if render_mesh.mesh and materials.size() > 0:
			for i in range(render_mesh.mesh.get_surface_count()):
				if i < materials.size():
					render_mesh.set_surface_override_material(i, materials[i])



