extends Node




func _ready():
	_global_datas._active_this_zone.connect(_active)
	
	
	
func _active(condition : bool, zone : ZoneData):
	
	
	if zone.Boue_active:
		zone.Sprite_render.visible = false
	else:
		zone.Sprite_render.visible = condition		
	
	
