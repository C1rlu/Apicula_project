extends Node


@export var movable_object : Node3D


var rotate_right : bool = false
var rotate_left: bool = false


func _ready():
	_global_datas.select_movable_object.connect(_update_movable_object)

func _update_movable_object(object : Node3D):
	movable_object = object
	
	
func _input(event):
	
	if event.is_action_pressed("next_right"):
		rotate_right = true
	if event.is_action_released("next_right"):
		rotate_right = false
	
	
	if event.is_action_pressed("next_left"):
		rotate_left = true
	if event.is_action_released("next_left"):
		rotate_left = false
		

						
func _process(delta):
	
	if !movable_object:
		return
		
	if rotate_right:
		movable_object.rotation_degrees.y += 120 * delta	
	if rotate_left:
		movable_object.rotation_degrees.y -= 120 * delta	



