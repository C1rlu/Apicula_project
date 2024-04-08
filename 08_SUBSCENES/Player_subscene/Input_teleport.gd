extends Node

@onready var vfx_sphere_mirror = $"../../Render_mesh/Orbe_spawner_position/VFX_SPHERE_MIRROR"
var t

@export var teleporter_data : tool_data

func _ready():
	teleporter_data.tool_active_signal.connect(play_teleporter)		

func play_teleporter(condition : bool):
	
	if !_global_datas.Player_InSubScene:
		return
	
	if !_global_datas.Player_InMirrorScene:
		return
		
	if _global_datas._teleporter_list.size() == 0:
		return	
		
	if condition:
		_click_teleporter(condition)		
func _click_teleporter(condition : bool):
	
	vfx_sphere_mirror.emitting = condition

	if t:
		t.kill()
	
	if condition:	
	
		
		t = create_tween()
		t.tween_method(change_value,0.5,3.0,0.1)
		t.connect("finished",done)
		
func done():

	
	var start_position = _global_datas.subbscene_playerPosition
	
	_global_datas._teleport_at_position.emit(start_position)
	vfx_sphere_mirror.emitting = false
	
func change_value(value):
	vfx_sphere_mirror.speed_scale = value
	
	
