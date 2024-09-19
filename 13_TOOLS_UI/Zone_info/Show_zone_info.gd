extends Node

@export var info_root : Control

func _ready():
	_global_datas._show_zone_info.connect(_show)
	_global_datas._go_Subscene.connect(func(): _show(false))
	
	
	_show(false)
	
func _show(condition: bool):
	info_root.visible = condition	
	
