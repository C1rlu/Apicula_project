extends Node

@export var Render : TextureRect
@export var Backdrop : ColorRect
@export var Loader : Node3D

func _ready():
	_global_datas._open_boad_Focus.connect(_open)
	_global_datas._open_boad_Focus.emit(false, null)
	
func _open(condition : bool, board_element : element_data):
	
	
	if condition:
		_global_datas._add_back_call.emit(_back_call)
		clear_and_instantiate(board_element)
	
	Render.visible = condition
	Backdrop.visible = condition	
	_global_datas.Player_InMenu = condition

	
			
		
func clear_and_instantiate(board_element : element_data):
	
	
	
	var all_child = Loader.get_children()
	
	for e in all_child:
		e.queue_free()
	
	if board_element:
		if board_element.element_prefabs:
			var instantiate = board_element.element_prefabs.instantiate()
			instantiate.position = board_element.focus_start_position
			instantiate.rotation_degrees = board_element.focus_start_rotation_degrees
			instantiate.scale = Vector3(board_element.focus_start_scale,board_element.focus_start_scale,board_element.focus_start_scale)
			Loader.add_child(instantiate)
	
			
func _back_call():
	_global_datas._open_boad_Focus.emit(false, null)	
