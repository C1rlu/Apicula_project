extends Node

@onready var root = $"../.."

func remover():
	root.queue_free()
