extends Node

signal fusion
@onready var organic_oddity = $".."

func _on_fusion():
	organic_oddity.queue_free()


