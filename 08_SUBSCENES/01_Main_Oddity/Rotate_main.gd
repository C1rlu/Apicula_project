extends Node
@onready var root = $"../../Render_root"

var rotation_target : Vector3
var t


func _on_random_range_update_timeout():
	rotation_target = Vector3(randf_range(-2.0,2.0),randf_range(-2.0,2.0),randf_range(-2.0,2.0))
	rotate_target()

func rotate_target():
	
	
	if t:
		t.kill()
	
	var random_time = randf_range(0.25,0.5)	
	t = create_tween()
	t.tween_property(root,"rotation",rotation_target,random_time).set_trans(Tween.TRANS_SPRING)

