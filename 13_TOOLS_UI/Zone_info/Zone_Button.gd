extends Button


func _ready():
	pressed.connect(_open_zone_selector)
	
	
func _open_zone_selector():
	_global_datas._open_zone_attributions.emit(true)
