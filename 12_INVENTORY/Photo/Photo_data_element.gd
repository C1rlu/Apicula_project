extends Node

@export var photoData : PhotoData
@export var information : info_data

@export var root : Node3D

signal scanner_effect_condition(condition : bool)
@export var in_mirror : Node


@onready var timer = $Timer


var is_scanning : bool = false

func _ready():
	_global_datas._photo_data_scene_list.append(self)	
	
func get_PhotoData():
	return photoData 
	
func scanning():
	
	if in_mirror:
		if in_mirror.State_selected != _global_datas.player_state:
			return
		
	if is_scanning:
		return
		
	is_scanning = true
	if timer:		
		timer.start()
		
	scanner_effect_condition.emit(true)



func stop_scanning():
	
	if timer:
		timer.stop()

	is_scanning = false
	scanner_effect_condition.emit(false)
	

func scanning_done():
	
	stop_scanning()
	
	_global_datas.selected_photoData = photoData
	_global_datas.flash_scanner.emit()
	photoData.intrige_state = photoData.intrigue_s.started
	
	if information:
		_global_datas.information_added.emit(information)

func get_node_position():
	return 	root.global_position


func _on_timer_timeout():
	scanning_done()

func _on_tree_exited():
	_global_datas._photo_data_scene_list.erase(self)	
	



