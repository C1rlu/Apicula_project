extends Node


func _ready():
	_global_datas._in_select_element_state.connect(_select_element_state)	
	
func _select_element_state(condition : bool):
	
	if condition:
		_global_datas._open_quest_on_board.emit(false)
		RenderingServer.global_shader_parameter_set("isGray", true)	
	else:
		RenderingServer.global_shader_parameter_set("isGray", false)	
