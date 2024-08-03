extends Node

@onready var sub_viewport = $"../.."


func _ready():
	takePhoto()

func takePhoto():

	await get_tree().create_timer(0.1).timeout
	var capture = get_viewport().get_texture().get_image() 

	capture.save_png('res://screenshot/imageNamed.png')
	print("done")
