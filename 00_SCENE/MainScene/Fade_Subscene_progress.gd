extends Node

func _ready():
	_global_datas._active_progress_subscene.connect(_start_progress)

func _start_progress(condition : bool):
	
	if _global_datas.cell_name =="null":
		return
		
	if condition:
		print("start progress")
		_global_datas.Open_ui_dark_backdrop.emit(true)

	else:
		print("stop progress")
		_global_datas.Open_ui_dark_backdrop.emit(false)

