extends Button



func _ready():
	pressed.connect(_select_this_zone)
	
	
func _select_this_zone():
	
	_global_datas._execute_back_call.emit()

	
