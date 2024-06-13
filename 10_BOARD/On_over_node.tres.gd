extends Node

@export var _on_over : Node3D
@export var icon_type : icon_class.icon_list
func on_over(condition):
	if _on_over:
		_on_over.visible = condition	
	
	
	_global_datas.switch_icon_cursor.emit(icon_type)
