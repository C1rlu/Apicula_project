extends Button

@onready var root = $".."

func _take_it():

	_global_datas.Open_ui_dark_backdrop.emit(false)
	root.queue_free()
	if _global_datas.Npc_Dialogue != null:
		_global_datas._start_dialogue_box.emit()


func _on_pressed():
	_take_it()
