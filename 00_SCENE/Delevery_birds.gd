extends Node

@export var birds_scene : Array[Node3D]

func _ready():
	
	_global_datas._deliver_inbox_element.connect(_use_bird)
	_global_datas._set_night.connect(_show_all_birds)
	_hide_all_birds()
	
	
func _use_bird():
	_global_datas.delevery_birds_amout -= 1
	
	for b in birds_scene:
		b.visible = false
	
	for i in _global_datas.delevery_birds_amout:
		birds_scene[i].visible = true 

func _show_all_birds():
	for b in birds_scene:
		b.visible = true
	
func _hide_all_birds():
	for b in birds_scene:
		b.visible = false
