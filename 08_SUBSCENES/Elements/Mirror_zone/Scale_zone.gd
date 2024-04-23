extends Node

@onready var root = $".."

var t


func _ready():
	pass
	#_start()	


func _start():
	
	if t:
		t.kill()
	t = create_tween()
	t.tween_method(scale_value,5.0,1.0,30.0)	
	t.connect("finished",done)		


func done():
	_global_datas._mirror_switch.emit(false)	
	

func scale_value(value : float):

	root.scale = Vector3(value,value,value)	
