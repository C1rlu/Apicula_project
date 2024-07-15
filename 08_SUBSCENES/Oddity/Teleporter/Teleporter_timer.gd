extends Node

@onready var timer = $Timer
@onready var root = $".."
@onready var area = $"../Area3D"

signal teleport_effect


func _ready():
	timer.start()
	

func _teleport():
	
	_global_datas.selected_subscene = root.teleport_zone
	_global_datas.in_mirror_zone.emit(true)
	_global_datas.teleportation_active = true
	_global_datas._load_subscene.emit(true)
	
	print("TELEPORT TO ")

func check_teleporter_area():
	
	var all_area = area.get_overlapping_areas()
	
	if all_area:
		for areas in all_area:
			
			var player = areas.get_node_or_null("Player")
			if player :
				_teleport()
	
					
func _on_timer_timeout():
	check_teleporter_area()
