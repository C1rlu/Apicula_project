extends Node

@onready var cam_target = $"../BOARD_UI/SubViewport/CamTarget"
var t
func _ready():
	_global_datas.focus_this_on_board.connect(_focus_this)
	




func _input(event):
	
	if !_global_datas.Player_In_Inventory:
		return
		
	if event.is_action_pressed((_global_datas.move_right)):
		if t:
			t.kill()	
	if event.is_action_pressed((_global_datas.move_left)):
		if t:
			t.kill()	
	if event.is_action_pressed((_global_datas.move_forward)):
		if t:
			t.kill()	
	if event.is_action_pressed((_global_datas.move_backward)):
		if t:
			t.kill()	

		
func _focus_this(target : Vector3):

	if !_global_datas.Player_In_Inventory:
		return
		
	if _global_datas.zoom_value == 1:
		return	
		
		
	var offset = Vector3(0.0,0.0,-0.035)	
	if t:
		t.kill()
	t = create_tween()
	
	t.tween_property(cam_target,"position",target + offset,0.5)
