extends Node

@onready var mirror_particule : GPUParticles3D = $"../Mirror_Particule"

@onready var take_photo = $"../Take_Photo"

func _on_element_photo_prefabs_3_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.get_node_or_null("Player_photoActive"):
		
		mirror_particule.emitting = true
		take_photo.in_zone = true
		print("CAN CLICK")
func _on_element_photo_prefabs_3_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	
	if take_photo.in_zone:
		mirror_particule.emitting = false
		take_photo.in_zone = false
