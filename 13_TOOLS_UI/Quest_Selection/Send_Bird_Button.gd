extends Button



func _ready():
	pressed.connect(_send_bird)
	
	
	
func _send_bird():
	_global_datas.sending_bird.emit()
