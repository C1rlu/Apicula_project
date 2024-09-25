extends Button



func _ready():
	pressed.connect(_open)		

func _open():
	_global_datas._in_delivery_mode.emit(true)	
	
	
