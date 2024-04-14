extends Node

@export var photoData : PhotoData
	

signal scanner_effect_condition(condition : bool)
signal scanner_effect_value(value : float)

@onready var root =  $"../.."
@onready var timer = $Timer


@export var active_photo_data : bool = true
var is_scanning : bool = false

func  _ready():
	
	if active_photo_data:
		_global_datas._photo_data_scene_list.append(self)	

func get_PhotoData():
	return photoData 
	
func scanning():
	

	
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
	

func set_shader_value(value):
	scanner_effect_value.emit(value)	

	
func scanning_done():
	
	stop_scanning()
	
	_global_datas.selected_photoData = photoData
	_global_datas.show_on_scanner.emit(true)
	_global_datas._show_object_legend.emit(true,photoData.legend)
	
func get_node_position():
	return 	root.position

func _on_area_take_it_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	
	if area:
		var player_out = area.get_node_or_null("Player")	 
		if player_out:
			stop_scanning()		
		
func disable_photoData():
	_global_datas._photo_data_scene_list.erase(self)	

func _on_timer_timeout():
	scanning_done()



func _on_tree_exited():

	_global_datas._photo_data_scene_list.erase(self)	
	
