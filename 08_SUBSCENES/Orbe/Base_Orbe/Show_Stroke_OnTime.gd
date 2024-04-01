extends Node


@onready var render = $"../Render"


func _ready():
	render.visible = false
	#_global_datas._instance_visual_Orbe.connect(_show)
	
	
func _show():
	render.visible = true	
	
