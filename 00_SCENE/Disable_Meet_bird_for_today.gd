extends Node

@export var Npc_data : Npc_datas
@export var Visual_root : Area3D
@export var Collider : CollisionShape3D


func _ready():
	_global_datas._disable_bird_meet_for_today.connect(_disable)
	

func _disable(condition : bool):

	Visual_root.visible = !condition
	Npc_data.is_active = !condition

	
