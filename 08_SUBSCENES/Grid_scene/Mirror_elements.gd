extends Node
@onready var root = $".."

@export var elements_mesh : Array[MeshInstance3D]
@export var elements_mesh_xray : Array[MeshInstance3D]

@export var element_collision : Array[CollisionShape3D]

var _follow_player : bool = false

func _ready():
	
	_global_datas._mirror_switch.connect(_active_mirror_Elements)
	


func _active_mirror_Elements(condition : bool):
	
	
	if _follow_player:
		return
		
	if elements_mesh.size() < 1:
		return
	
	for element in elements_mesh:
		element.visible = condition

	for col in element_collision:
		col.set_deferred("disabled",!condition)	


func _on_rapatrier_rapatrier():
	_active_mirror_Elements(true)
	print("RAPATRIER CALL OK")
	#_global_datas.rapatrier_vfx.emit(root.position)
	for e in elements_mesh_xray:
		e.visible = false
