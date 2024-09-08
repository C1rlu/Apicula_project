extends Node

@export var Camera :Camera3D
@export var _loader : Node3D
@export var Render : TextureRect
@export var rotation_degrees : float = 45

var is_rotation : bool
func _ready():
	pass
	
	
func _input(event):
	
	if !Render.visible:
		return
	
	if Input.is_action_pressed("move_right"):
		#var _magnitude = Input.get_action_strength("move_right")
		_on_rotate(-1)
	if Input.is_action_pressed("move_left"):
		#var _magnitude = Input.get_action_strength("move_left")
		_on_rotate(1)
	if Input.is_action_pressed("move_forward"):
		#var _magnitude = Input.get_action_strength(_global_datas.move_forward)
		_zoom_in()
	if Input.is_action_pressed("move_backward"):
		_zoom_out()
		#var _magnitude = Input.get_action_strength(_global_datas.move_backward)
		
func _on_rotate(direction):	

	if is_rotation:
		return	

	if direction == 1:
		var target_rotation = _loader.rotation_degrees.y - rotation_degrees
		var t
		t = create_tween()
		t.tween_property(_loader,"rotation_degrees",Vector3(0.0,target_rotation,0.0),0.1)
		t.connect("finished",done)
		is_rotation = true
	if direction == -1:
		var t
		var target_rotation = _loader.rotation_degrees.y + rotation_degrees
		is_rotation = true
		t = create_tween()
		t.tween_property(_loader,"rotation_degrees",Vector3(0.0,target_rotation,0.0),0.1)
		t.connect("finished",done)

func _zoom_in():	
	
	var target = 45.0
	var t
	t = create_tween()
	t.tween_property(Camera,"fov",target,0.1)
	
func _zoom_out():	
	
	var target = 75.0
	var t
	t = create_tween()
	t.tween_property(Camera,"fov",target,0.1)
	

func done():
	is_rotation = false
