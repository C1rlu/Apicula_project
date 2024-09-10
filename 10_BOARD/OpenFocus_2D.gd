extends Node

@export var root : Control
@export var _loader : Control
@export var Backdrop : ColorRect

func _ready():
	_global_datas._open_board_focus_2D.connect(_open_focus)
	

func _open_focus(condition : bool,element : element_data):
	Backdrop.visible = condition
	root.visible = condition	
	if condition:
		_global_datas._add_back_call.emit(back_call)
		clear_and_instantiate(element)
	Backdrop.visible = condition	
	_global_datas.Player_InMenu = condition
	
func clear_and_instantiate(element : element_data):
	
	var all_child = _loader.get_children()
	
	for e in all_child:
		e.queue_free()
	
	if element:
		if element.element_prefabs_2D:
			var instantiate = element.element_prefabs_2D.instantiate()
			var is_photo = instantiate.get_node_or_null("Photo")
			if is_photo:
				is_photo._set_photo(element.photoData.image)

			#instantiate.position = element.focus_start_position
			#instantiate.rotation_degrees = element.focus_start_rotation_degrees
			#instantiate.scale = Vector3(element.focus_start_scale,element.focus_start_scale,element.focus_start_scale)
			_loader.add_child(instantiate)
	
			
func back_call():
	_global_datas._open_board_focus_2D.emit(false, null)	
