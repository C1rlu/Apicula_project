extends Node


var using_pad : bool = false



func _ready():
	_global_datas.using_pad.connect(_switch_inputs)
	_switch_inputs(false)
	
func _input(event):
	
	if event is InputEventJoypadButton or event is InputEventJoypadMotion:
		
		if !using_pad:
			_global_datas.using_pad.emit(true)
			using_pad = true
	else:
		
		if using_pad:
			_global_datas.using_pad.emit(false)
			using_pad = false
			
			
			
func _switch_inputs(condition : bool):
	if condition:
		
		_global_datas.move_right = "move_right_joy"
		_global_datas.move_left = "move_left_joy"
		_global_datas.move_forward = "move_forward_joy"
		_global_datas.move_backward = "move_backward_joy"	
	else:
		_global_datas.move_right = "move_right"
		_global_datas.move_left = "move_left"
		_global_datas.move_forward = "move_forward"
		_global_datas.move_backward = "move_backward"
