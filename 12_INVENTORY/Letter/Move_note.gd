extends Control

var t
var r
@onready var take_it_button = $Take_it_button

func _ready():	
	move()
	
	
func move():
	var resolution : Vector2 = get_viewport_rect().size
		
	var start_position = Vector2(resolution.x / 2.0, resolution.y)

	var target_position = Vector2(resolution.x / 2.0, resolution.y/ 2)
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
