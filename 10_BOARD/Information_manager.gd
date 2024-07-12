extends Node



func _ready():
	_global_datas.information_added.connect(active_information)

func active_information(information : info_data):
	
	if information == null:
		print("PLS SELECT A INFO DATA ")
		return
	if !information.is_discovered:
		information.is_discovered = true
		_global_datas.ui_noted_taked.emit()
		_global_datas._show_object_legend.emit(true,information)
