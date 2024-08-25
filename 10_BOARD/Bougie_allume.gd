extends Node


@export var On_View : Node
@export var Light : Light3D
@export var Flame : MeshInstance3D
var is_active : bool = false
func _ready():
	On_View.On_View.connect(active)
	
	
func active():

	is_active =!is_active
	Flame.visible = is_active
	#Light.visible = is_active
