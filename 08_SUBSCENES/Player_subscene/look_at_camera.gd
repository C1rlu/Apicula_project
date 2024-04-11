extends Node3D



var active : bool
@onready var light_position = $"."


func _ready():
	_global_datas._backFrom_subscene.connect(_disable)
	_global_datas._go_Subscene.connect(_active)
	
	
	
func _active():
	
	active = true
	
func _disable():
	
	active = false
	
func _process(delta):
	
	if !active:
		return
		
	var target = _global_datas.Subscene_Camera.position
	light_position.look_at(target)
