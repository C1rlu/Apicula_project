extends Node

@onready var msh_oddity_peon = $"../Render_root"

var base_scale : Vector3

@onready var parabol_mesh = $"../Render_root/Parabol_mesh"
@onready var fade_flash = $"../Fade_flash"


func _ready():
	pass
	
func _add_sonar():
	parabol_mesh.visible = true
	fade_flash.active = true
