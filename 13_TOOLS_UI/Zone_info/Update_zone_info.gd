extends Node


@export var zone_text : Label



func _ready():
	_global_datas._active_sonar.connect(_update)
	
	
func _update(_null):
	
	
	if zone_text.text != _global_datas.subscene_zone_index:		 
		zone_text.text = _global_datas.subscene_zone_index
