extends Node

@export var photoData : PhotoData
	
var t
var actual_value : float

signal scanner_effect_condition(condition : bool)
signal scanner_effect_value(value : float)

@onready var root =  $"../.."

func get_PhotoData():
	
	return photoData 
	
func scanning(condition : bool):
	
	if t:
		t.kill()
	
	if condition:
		t = create_tween()
		t.tween_method(set_shader_value,0.0,1.0,1.0).set_ease(Tween.EASE_OUT)
		#t.connect("finished", scanning_done)
	else:
		t = create_tween()
		t.tween_method(set_shader_value,actual_value,0.0,1.5)
		
	scanner_effect_condition.emit(condition)
	
func set_shader_value(value):
	scanner_effect_value.emit(value)	
	actual_value = value
	

func scanning_done():
	
	scanning(false)
	var photo_data = get_PhotoData()
	_global_datas.selected_photoData = photo_data 
	_global_datas.show_on_scanner.emit(true)

func get_node_position():
	return 	root.position
