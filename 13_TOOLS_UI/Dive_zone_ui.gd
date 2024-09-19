extends Node


@export var Dive_img : TextureRect


func _ready():
	_global_datas.player_in_diveZone.connect(_enable)
	_global_datas._go_Subscene.connect(func(): _enable(false))
	
func _enable(condition : bool):
	
	Dive_img.visible = condition	
	


func _input(event):
	
	if !Dive_img.visible:
		return
		
	if event.is_action("Push_to_subscene"):
		_global_datas._show_zone_info.emit(true)				
		
