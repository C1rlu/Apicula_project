extends Node

@export var photoData : PhotoData
@export var root : Node3D
@export var _in_mirror : bool = false
signal scanner_effect_condition(condition : bool)


@onready var timer = $Timer


var is_scanning : bool = false

func _ready():
	_global_datas._photo_data_scene_list.append(self)	
	
func check_photo_exist(photo_Data):
	
	for photo in _global_datas.photo_archives:
		if photo == photo_Data:
			return true 
				
func get_PhotoData():
	return photoData 
	
func scanning():
	
	if _in_mirror:
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
	_global_datas.show_on_scanner.emit(true)
	#_global_datas._show_object_legend.emit(true,photoData.legend)
	photoData.board_information_state = 2
	_global_datas.ui_noted_taked.emit()
	if !check_photo_exist(photoData):
		_global_datas.photo_archives.append(photoData)
	
func get_node_position():
	return 	root.global_position


func _on_timer_timeout():
	scanning_done()

func _on_tree_exited():
	_global_datas._photo_data_scene_list.erase(self)	
	



