extends Node

@onready var camera_3d = $"../SubViewport/Camera3D"

var normal_position : Vector3
var t 
func _ready():
	_global_datas._update_cam_focus.connect(_update_cam_focus)
	normal_position = camera_3d.position 
	
func _update_cam_focus(index):

	if index == 0:
		_smooth_movement(normal_position)
		return	
		
	var cam_list = _global_datas.Npc_Dialogue.camera_state
	var position_from_index = cam_list[index]

	
	_smooth_movement(position_from_index)
func _smooth_movement(new_position):
	
	if t:
		t.kill()
		
	t = create_tween()
	t.tween_property(camera_3d,"position",new_position,0.25)	

