extends Node

@onready var render = $"../Render"
@onready var mirror_sphere = $"../Mirror_sphere_msh/mirror_sphere"


func show_normal():
	render.visible = true	
	mirror_sphere.visible = false


func show_mirror():
	render.visible = false
	mirror_sphere.visible = true
