extends Node

@export var root : Node3D
@export var Movable : Node3D
@export var Movable_node : Node
@export var On_Over : Node
var list_of_selection_data : Array[selection_data]

const MOVING_OBJECT : Material = preload("res://00_SCENE/Board_control_object_test/Material/moving_object_dither.tres")
const MOVING_OVERLAP_OBJECT : Material = preload("res://00_SCENE/Board_control_object_test/Material/overlaping_object_dither.tres")
const ON_OVER_OBJECT = preload("res://00_SCENE/Board_control_object_test/Material/OnOver_object.tres")
func _ready():
	
	if Movable:
		Movable.select_render_state.connect(ini_selection)
	if Movable_node:
		Movable_node.select_render_state.connect(ini_selection)
	#if On_Over:
		#On_Over.On_Over.connect(set_on_over)
	
	var utility = GameUtility.new()
	list_of_selection_data.append_array(utility.archive_materials(root))

	set_OverPass()
	
	_global_datas._open_boad_Focus.connect(_stop_onOver)
	
	
func _stop_onOver(condition,element):
	if condition:
		
		
		var utility = GameUtility.new()
		var n_timer = utility.create_timer(0.01,close,self)
		n_timer.start()

func close():
	set_on_over(false)	
		
func ini_selection(index_state : int):

	if index_state == 0:
		restore_original_materials()

	if index_state == 1:
		set_all_material(MOVING_OBJECT)
	if index_state == 2:
		set_all_material(MOVING_OVERLAP_OBJECT)
		


func set_OverPass():
	for selection in list_of_selection_data:
		for m in selection.render_material:
			var new_pass = ON_OVER_OBJECT.duplicate()
			m.set_next_pass(new_pass)
			
				

func set_on_over(condition : bool):
	
	for selection in list_of_selection_data:
		for m in selection.render_material: 
			var over_pass = m.get_next_pass()
			if over_pass:
				over_pass.set_shader_parameter("on_over", condition)	
		
func set_all_material(material : Material):
	
	for selection in list_of_selection_data:
		var render_mesh = selection.render_mesh
		
		if render_mesh.mesh:
			for i in range(render_mesh.mesh.get_surface_count()):
				render_mesh.set_surface_override_material(i, material)

func restore_original_materials():
	for selection in list_of_selection_data:
		var render_mesh = selection.render_mesh
		var materials = selection.render_material
		
		if render_mesh.mesh and materials.size() > 0:
			for i in range(render_mesh.mesh.get_surface_count()):
				if i < materials.size():
					render_mesh.set_surface_override_material(i, materials[i])



