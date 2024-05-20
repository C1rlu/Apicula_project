extends Node

@onready var msh_oddity_peon = $"../Render_root"

var base_scale : Vector3

@onready var parabol_mesh = $"../Render_root/Parabol_mesh"
@onready var fade_flash = $"../Fade_flash"


func _ready():
	base_scale = msh_oddity_peon.scale
	
func scale_up():
	
	base_scale += Vector3(0.1,0.1,0.1)	
	msh_oddity_peon.scale = base_scale
	
func _add_organic():
	scale_up()	


func _add_sonar():
	parabol_mesh.visible = true
	fade_flash.active = true
