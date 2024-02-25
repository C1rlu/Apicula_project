extends Node

@export var mirror_destination : String

@onready var collider = $Collider
@onready var render = $MeshInstance3D



func _ready():
	_active(_global_datas.Player_InMirrorScene)
	
	_global_datas.active_mirror_switch.connect(_active)

func _active(condition : bool):

	collider.disabled = !condition	
	render.visible = condition
