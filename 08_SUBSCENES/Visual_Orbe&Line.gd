extends Node

const BASE_ORBE_VISUAL_PREFABS = preload("res://08_SUBSCENES/Orbe/Base_Orbe/Base_Orbe_Visual_prefabs.tscn")

var Big_orbe : Array[Node3D]
@onready var load_scene = $"../../../LoadScene"
@onready var timer = $Timer

func _ready():
	
	_global_datas._instance_stroke.connect(instance_visualOrbe)
	_global_datas._backFrom_subscene.connect(disable_BigOrb)
	_global_datas._photo_flash.connect(disable_BigOrb)
	
	
func instance_visualOrbe():
	
	
	
	var target = _global_datas._orbe_tool_origin_position	
				
	var orbe = BASE_ORBE_VISUAL_PREFABS.instantiate()
	orbe.position  = target 
	load_scene.add_child(orbe)
	Big_orbe.append(orbe)
	
	
	timer.start()

func disable_BigOrb():
	
	for i in Big_orbe:
		i.queue_free()
		
	Big_orbe.clear()		
	



func _on_timer_timeout():
	instance_visualOrbe()
	timer.stop()
