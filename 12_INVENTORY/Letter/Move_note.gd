extends Control

var t
var r
@onready var take_it_button = $Take_it_button

func _ready():	
	move()
	
	
func move():
	
	var start_position = Vector2(1280.0 / 2.0, 720.0)
	var target_position = Vector2(1280.0 / 2.0, 720/ 2.0 )
	var random_angle = randf_range(-6.0, -4.0)
	position = start_position
	
	if t:
		t.kill()
		
	t = create_tween()
	t.tween_property(self,"position",target_position,0.3).set_trans(Tween.TRANS_SINE)
	t.connect("finished",done)
	
	
	if r:
		r.kill()
		
	r = create_tween()
	r.tween_property(self,"rotation_degrees",random_angle,0.3).set_trans(Tween.TRANS_SINE)
	
	
func done():
	take_it_button.grab_focus()	
