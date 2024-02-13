extends Node

@onready var cam_target = $"../BOARD_UI/SubViewport/CamTarget"
var t
func _ready():
	_global_datas.focus_this_on_board.connect(_focus_this)

func _input(event):
	
	if !_global_datas.Player_In_Inventory:
		return
		
	
		
		
	if event.is_action_pressed(("move_right")):
		if t:
			t.kill()	
	if event.is_action_pressed(("move_left")):
		if t:
			t.kill()	
	if event.is_action_pressed(("move_forward")):
		if t:
			t.kill()	
	if event.is_action_pressed(("move_backward")):
		if t:
			t.kill()	

		
func _focus_this(target : Vector3):

	if !_global_datas.Player_In_Inventory:
		return
		
	if _global_datas.zoom_value == 1:
		return	
	if t:
		t.kill()
	t = create_tween()

	t.tween_property(cam_target,"position",target,0.5)
