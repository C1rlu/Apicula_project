extends Button

@onready var root = $".."

func _take_it():

	_global_datas.Open_ui_dark_backdrop.emit(false)
	_global_datas._show_object_legend.emit(false,"")
	root.queue_free()

	_global_datas._show_dialogue_box.emit()
	_global_datas._start_dialogue_box.emit()
	

func _on_pressed():
	_take_it()
