extends Node

@onready var root = $".."

var t 
func _ready():
	scale_up()
	
func scale_up():
	
	if t:
		t.kill()
	
	t = create_tween()
	t.tween_method(change_value,0.5,1.8,0.5)
	
func change_value(value):
	root.scale = Vector3(value,value,value)
