extends Node

@export var elements_mesh : Array[MeshInstance3D]
@export var element_collision : Array[CollisionShape3D]
func _ready():
	_global_datas.active_mirror_switch.connect(_active_mirror_Elements)
	_global_datas._go_Subscene.connect(disable)
	
	_active_mirror_Elements(_global_datas.Player_InMirrorScene)	



func disable():
	
	_active_mirror_Elements(false)

	
func _active_mirror_Elements(condition : bool):
	
	
	if elements_mesh.size() < 1:
		return
	
	for element in elements_mesh:
		element.visible = condition

	for col in element_collision:
		col.disabled = !condition
