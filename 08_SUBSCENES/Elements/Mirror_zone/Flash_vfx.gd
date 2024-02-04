extends Node

@onready var mirror_particule : GPUParticles3D = $"../Mirror_Particule"

var enable : bool = true
var _in_zone = false
func _ready():
	_global_datas._take_photo.connect(_emit_particule_once)

func _emit_particule_once():
	
	if !_in_zone:
		return
		
	if enable:
		mirror_particule.emitting = true

func _disable():
	enable = false


func _on_element_photo_prefabs_3_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.get_node_or_null("Player_photoActive"):
		_in_zone = true	


func _on_element_photo_prefabs_3_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	if area.get_node_or_null("Player_photoActive"):
		_in_zone = false


