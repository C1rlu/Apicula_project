extends Button



func _ready():
	
	pressed.connect(dive_now)

	
func dive_now():
	_global_datas._load_subscene.emit(true)
	_global_datas._go_Subscene.emit()
