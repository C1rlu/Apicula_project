extends Node

@onready var root = $".."

var t 
func _ready():
	scale_up()
	
func scale_up():
	
	if t:
		t.kill()
	
	t = create_tween()
	t.tween_method(change_value,0.5,2.0,0.25).set_trans(Tween.TRANS_CUBIC)
	
func change_value(value):
	root.scale = Vector3(value,value,value)


func _on_area_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body:
		var player = body.get_node_or_null("Player") 
		if player:
			_global_datas._photo_flash.emit()
