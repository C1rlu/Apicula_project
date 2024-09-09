extends TextureButton



func _ready():
	pressed.connect(_open)
	mouse_entered.connect(on_mouse)
	mouse_exited.connect(on_mouse_exit)
func _open():
	_global_datas._open_quest_on_board.emit(true)

func on_mouse():
	_global_datas._on_button_ui = true
	print(_global_datas._on_button_ui)
	
func on_mouse_exit():
	_global_datas._on_button_ui = false
	print(_global_datas._on_button_ui)	
