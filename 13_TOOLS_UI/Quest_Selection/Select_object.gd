extends Button


func _ready():
	pressed.connect(_in_select_state)
	

func _in_select_state():
	_global_datas._in_select_element_state.emit(true)
