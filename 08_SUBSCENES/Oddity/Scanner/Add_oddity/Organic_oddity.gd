extends Node

signal fusion
@onready var root = $".."

func _on_fusion():
	root.queue_free()


