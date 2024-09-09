extends Node

@onready var on_select_mode_border = $On_Select_Mode_border


func _ready():
	_global_datas._in_select_element_state.connect(_select_element_state)	
	
func _select_element_state(condition : bool):
	
	_global_datas._in_selection_state = condition
	
	
	if condition:
		_global_datas._open_quest_on_board.emit(false)
		#RenderingServer.global_shader_parameter_set("isGray", true)
		on_select_mode_border.visible = true
		_global_datas._add_back_call.emit(_call_back)
	else:
		#RenderingServer.global_shader_parameter_set("isGray", false)	
		_global_datas._open_quest_on_board.emit(true)
		on_select_mode_border.visible = false
		
	
func _call_back():
	_global_datas._in_select_element_state.emit(false)
	
