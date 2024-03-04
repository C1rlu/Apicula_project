extends Node

@onready var vfx_sphere_mirror = $"../../VFX_SPHERE_MIRROR"


var t
func _input(event):
	
	if !_global_datas.Player_InSubScene:
		return
		
	if _global_datas._teleporter_list.size() == 0:
		return
	
	if event.is_action_released("Add_teleporter"):
		_click_teleporter(false)		
		
	if event.is_action_pressed("Add_teleporter"):
		_click_teleporter(true)	
			

func _click_teleporter(condition : bool):
	
	vfx_sphere_mirror.emitting = condition

	if t:
		t.kill()
	
	if condition:	
		t = create_tween()
		t.tween_method(change_value,0.5,3.0,0.5)
		t.connect("finished",done)

func done():
	_global_datas._teleport_at_position.emit()
	vfx_sphere_mirror.emitting = false
	
func change_value(value):
	vfx_sphere_mirror.speed_scale = value
	
	