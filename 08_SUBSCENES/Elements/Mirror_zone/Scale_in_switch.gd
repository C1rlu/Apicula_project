extends Node

@onready var root = $"../.."

@export var mirror_zone_limite : orbe_data
@onready var mirror_root = $"../.."
@onready var render_vortex_globe_effect = $"../Render_vortex_globe_effect"
@onready var render_vortex = $"../Render_vortex"
@onready var area_col = $"../CollisionShape3D"

var t


func _ready():
	_global_datas._mirror_switch.connect(_scale_globe_effect)

	
	
func _scale_globe_effect(condition : bool):
	
	render_vortex_globe_effect.visible = true
	

		
	if condition:
		if t:
			t.kill()
		t = create_tween()
		t.tween_method(scale_value,1.0,5.0,0.5)	
		t.connect("finished",hide)	
	else :	
		
		show()
		
		if t:
			t.kill()
		t = create_tween()
		t.tween_method(scale_value,5.0,1.0,0.5)	
		t.connect("finished",show_end)


									
func hide():
	render_vortex_globe_effect.visible = false	
	render_vortex.visible = false
	#var target = root.global_position
	#_global_datas.instance_orbe_result.emit(mirror_zone_limite,target)
	
	mirror_root.queue_free()

func show():
	render_vortex_globe_effect.visible = true
	render_vortex.visible = true	
	
func show_end():
	
	mirror_root.queue_free()
								
func scale_value(value : float):
	render_vortex_globe_effect.scale = Vector3(value,value,value)	
	render_vortex.scale = Vector3(value,value,value)	
	

func _on_tree_exited():
	_global_datas.Mirror_vortex_Node = null
