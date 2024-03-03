extends Node

@onready var teleporter = $"../../Teleporter"


func remove_teleporter():
	teleporter._remove_teleporter()

