extends Button

func _ready():
	
	pressed.connect(_open_map)

	
func _open_map():
	
	_global_datas._open_player_map.emit(true)
	
	

