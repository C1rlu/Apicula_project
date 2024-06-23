extends Node

@export var _on_over : Node3D
@export var _on_over_second: Node3D
@export var icon_type : icon_class.icon_list
@export var lock_in_link : bool = false
func on_over(condition):
	
	if lock_in_link:
		if _global_datas.link_mode:
			return
			
	if _on_over:
		_on_over.visible = condition	
	if _on_over_second:
		_on_over_second.visible = condition
		
	_global_datas.switch_icon_cursor.emit(icon_type)
