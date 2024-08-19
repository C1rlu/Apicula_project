extends Node


@export var On_View : Node
@export var Flame : MeshInstance3D
var is_active : bool = false
func _ready():
	On_View.On_View.connect(active)
	
	
func active():
	print("ACTIVEEE")
	is_active =!is_active
	Flame.visible = is_active
