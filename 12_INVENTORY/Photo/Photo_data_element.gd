extends Node

@export var photoData : PhotoData
	
var t
var actual_value : float

signal scanner_effect_condition(condition : bool)
signal scanner_effect_value(value : float)

@onready var root =  $"../.."

var is_scanning : bool = false

func  _ready():
	_global_datas._photo_data_scene_list.append(self)	

func get_PhotoData():
	return photoData 
	
func scanning():
	
	if is_scanning:
		return
		
	is_scanning = true
	
	if t:
		t.kill()
		
	t = create_tween()
	t.tween_method(set_shader_value,0.0,1.0,1.0).set_ease(Tween.EASE_OUT)
	t.connect("finished", scanning_done)
	
	scanner_effect_condition.emit(true)


		
func stop_scanning():
	
	var trees = get_tree()
	
	if !trees:
		return
		
	if t:
		t.kill()
	
	t = create_tween()
	t.tween_method(set_shader_value,actual_value,0.0,1.5)
			
	scanner_effect_condition.emit(false)
	
	is_scanning = false
		
func set_shader_value(value):
	scanner_effect_value.emit(value)	
	actual_value = value
	
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
		
