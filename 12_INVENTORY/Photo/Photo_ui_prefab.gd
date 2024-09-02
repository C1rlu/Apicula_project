extends Control

@export var Photo_Border : TextureRect

@export var take_it_button : Button 

@onready var take_photo = $Take_Photo

var t
var r


func _set_photo(image_texture : Texture2D):
	Photo_Border.texture = image_texture
	
func _ready():	
	
	move()
	take_photo.pressed.connect(out_movement)
	
func move():
	
	
	Engine.time_scale = 0.1	
	var resolution : Vector2 = get_viewport_rect().size
		
	var start_position = Vector2(resolution.x / 2.0, resolution.y)

	var target_position = Vector2(resolution.x / 2.0, resolution.y/ 2)
	var random_angle = randf_range(-6.0, -4.0)
	position = start_position
	
	if t:
		t.kill()

	t = create_tween()

	
	t.tween_property(self,"position",target_position,0.05).set_trans(Tween.TRANS_SINE)
	t.connect("finished",grab_button)
	
	
	if r:
		r.kill()
		
	r = create_tween()
	r.tween_property(self,"rotation_degrees",random_angle,0.05).set_trans(Tween.TRANS_SINE)
	
func grab_button():
	take_it_button.grab_focus()
		
func out_movement():
	
	take_it_button.release_focus()
	var resolution : Vector2 = get_viewport_rect().size
	
	var target_position = Vector2(resolution.x+100, resolution.y/ 2.0)
	var random_angle = randf_range(-6.0, -90.0)

	if t:
		t.kill()
		
	t = create_tween()
	t.tween_property(self,"position",target_position,0.03).set_trans(Tween.TRANS_SINE)
	t.connect("finished",done)
	
	if r:
		r.kill()
		
	r = create_tween()
	r.tween_property(self,"rotation_degrees",random_angle,0.03).set_trans(Tween.TRANS_SINE)	
	
func done():
	Engine.time_scale = 1.0
	queue_free()
	
