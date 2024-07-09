extends Node
@onready var root = $".."

var t

func _ready():
	scale()	


func scale():

	if t:
		t.kill()
	
	t = create_tween()
	t.tween_method(value,0.5,5.0,0.5).set_trans(Tween.TRANS_SINE)
	t.connect("finished",done)
	
func done():
	root.queue_free()
func value(size : float):
	
	root.scale = Vector3(size,size,size)	
