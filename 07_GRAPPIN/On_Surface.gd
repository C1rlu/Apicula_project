extends Node


@export var On_surface_area : Area3D


func _ready():
	On_surface_area.area_entered.connect(_back_from_subscene)		
	
	
func _back_from_subscene(area):
	if area:
		var surface = area.get_node_or_null("Player")
		if surface:
			_subscene_datas.go_subscene.emit(false)	
