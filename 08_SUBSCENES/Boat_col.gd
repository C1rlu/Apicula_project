extends Node

@onready var coll = $"../CollisionShape3D"

func _ready():
	_global_datas._start_ini_subscene.connect(_disable)
	_global_datas._end_ini_subscene.connect(_active)
	
	
func _active():
	coll.disabled = false
	
func _disable():
	coll.disabled = true
