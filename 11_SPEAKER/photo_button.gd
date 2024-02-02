extends Button

func _ready():
	var number : int = 0
	set_focus_mode(number)

func _on_pressed():
	_global_datas._take_photo.emit()
	visible = false
