extends Node

@onready var root = $".."

signal change_value(value : float)


func _on_area_entered(area_rid, area, area_shape_index, local_shape_index):
	
	if area:
		var attractive = area.get_node_or_null("Attract_me")  
		
		if attractive:
			attractive.attract_me(true,root.global_position,change_value)
			
func _on_area_3d_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	if area:
		var attractive = area.get_node_or_null("Attract_me") 
		

		if attractive:
			attractive.attract_me(false,root.global_position,change_value)	
		

func _on_vortex_effect_atractor_strenght(strenght):
	pass
	#change_value.emit(strenght)
