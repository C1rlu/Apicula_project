extends Node

@export var elements_mesh : Array [MeshInstance3D]

func _ready():
	_global_datas.active_mirror_switch.connect(_active_mirror_Elements)


func _active_mirror_Elements(condition : bool):
	
	
	if elements_mesh.size() < 1:
		return
	
	for element in elements_mesh:
		element.visible = condition
		var col = element.get_node_or_null("All_render/CollisionShape3D")
		if col:
			col.disabled = !condition
