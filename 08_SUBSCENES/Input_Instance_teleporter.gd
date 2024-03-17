extends Node

@export var teleporter_data : tool_data
@onready var vfx_sphere_mirror = $"../VFX_SPHERE_MIRROR"
var t


func _ready():
	teleporter_data.tool_active_signal.connect(_play_tool)		
	
func _play_tool(condition : bool):
	
	if _global_datas.Player_InMirrorScene:
		return
		
	_click_teleporter(condition)	

func _click_teleporter(condition : bool):
	
	vfx_sphere_mirror.emitting = condition

	if t:
		t.kill()
	
	if condition:	
		t = create_tween()
		t.tween_method(change_value,0.5,3.0,0.5)
		t.connect("finished",done)
		
		_global_datas._show_orbe_ui.emit()
		
func done():
	
	_global_datas._instance_teleporter.emit()
	vfx_sphere_mirror.emitting = false
	
func change_value(value):
	vfx_sphere_mirror.speed_scale = value
	
