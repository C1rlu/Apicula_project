extends Node
@onready var root = $".."

var t

func _ready():
	scale()	

func scale():

	if t:
		t.kill()
	
	t = create_tween()
	t.tween_method(value,0.25,2,1.0).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
	t.connect("finished",done)
	
func done():
	root.queue_free()
func value(size : float):
	
	root.scale = Vector3(size,size,size)	
