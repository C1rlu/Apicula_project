extends Node

@onready var photo_render  : Sprite3D = $"../Photo/photo_render"

func _ready():
	_global_datas.show_on_scanner.connect(update)	
	
	var photo_data = _global_datas.selected_photoData
	var texture_data = photo_data.image
	photo_render.texture = texture_data 
	
func update(condition):
		
	if condition:
		var photo_data = _global_datas.selected_photoData
		var texture_data = photo_data.image
		photo_render.texture = texture_data 
