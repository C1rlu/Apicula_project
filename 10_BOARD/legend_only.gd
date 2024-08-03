extends Node3D

@export var legend_name : String = "set legend"
@export var legend_page : PackedScene
@export var camera_state : boardCamState_data
@export var book_position_offset : Vector3
@export var book_rotation_angle : float = -90.0


signal set_legend(legend : String)


func _ready():
	_set_legend()	
	
func _set_legend():
	set_legend.emit(legend_name)	
	


func _on_on_click_on_click():
	_global_datas.show_page.emit(legend_page)

	var book = _global_datas.book_data.book_node
	book.position = global_position  + book_position_offset
	var rotation_offset = book_rotation_angle - book.position.x * 25
	book.rotation_degrees = Vector3(0,rotation_offset,0)
	
	var target = book.global_position

	_global_datas.focus_this_on_board.emit(target)
	_global_datas.camera_focus_On.emit(camera_state)
	
	
	_global_datas.book_idle_pos = false		
	_global_datas.book_back_idle_position.emit(true)
