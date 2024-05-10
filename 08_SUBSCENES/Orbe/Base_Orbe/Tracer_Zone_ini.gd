extends Node

@onready var root = $".."
@onready var gpu_explosed = $"../GPU_Explosed"
@onready var render_vortex = $"../Render_vortex"
@onready var gpu_normal = $"../GPU_normal"

var t 
var is_removing = false
func _ready():
	scale_up()
	_global_datas._photo_flash.connect(remover)
	
func remover():
	
	gpu_explosed.emitting = true
	render_vortex.visible = false
	is_removing = true
	gpu_normal.emitting = false
	
func scale_up():
	
	if t:
		t.kill()
	
	t = create_tween()
	t.tween_method(change_value,0.5,2.0,0.25).set_trans(Tween.TRANS_CUBIC)
	
func change_value(value):
	root.scale = Vector3(value,value,value)


func _on_area_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if is_removing:
		return
	if body:
		var player = body.get_node_or_null("Player") 
		if player:
			_global_datas._photo_flash.emit()
			_global_datas._scan_mirror_xray.emit()
			_global_datas._explosed_traceur_zone.emit()

func _on_gpu_explosed_finished():
	root.queue_free()
