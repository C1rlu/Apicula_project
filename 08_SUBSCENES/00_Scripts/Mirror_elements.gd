extends Node
@onready var root = $".."

@export var elements_mesh : Array[MeshInstance3D]
@export var elements_mesh_xray : Array[MeshInstance3D]

@export var element_collision : Array[CollisionShape3D]

func _active_mirror_Elements(condition : bool):
	
	if elements_mesh.size() < 1:
		return
	
	for element in elements_mesh:
		element.visible = condition
	

	for col in element_collision:
		col.set_deferred("disabled",!condition)	


func _on_rapatrier_rapatrier():
	_active_mirror_Elements(true)
	
	var vfx_pos = root.global_position
	_global_datas.rapatrier_vfx.emit(vfx_pos)
	
	print("RAPATRIER CALL OK")
	for e in elements_mesh_xray:
		e.visible = false
