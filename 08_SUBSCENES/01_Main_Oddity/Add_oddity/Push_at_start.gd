extends Node

@onready var root = $".."
@onready var movable_oddity = $"../Movable_oddity"

var t

func _push():
	
	var random_x = randf_range(-0.5,0.5)
	var random_y = randf_range(-0.5,0.5)
	var random_dir = root.position + Vector3(random_x,random_y,0.0)
	movable_oddity.move = true

	if t:
		t.kill()
	t = create_tween()
	
	t.tween_property(root,"position",random_dir,0.5).set_trans(Tween.TRANS_SINE)
	t.connect("finished",done)

func done():
	movable_oddity.move = true
	
func _on_organic_oddity_prefab_push():
	#_push()
	movable_oddity.move = true

