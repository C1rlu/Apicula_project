extends Node

@export var sonar_color_element : Color
@export var area_zone : Area3D


func _ready():
	
	area_zone.area_entered.connect(check_area)
	
func check_area(area):
	
	if area:
		var debris = area.get_node_or_null("Debris")
		if debris:
			debris.fade.emit(sonar_color_element)
			#debris.push_to_player.emit()
	
