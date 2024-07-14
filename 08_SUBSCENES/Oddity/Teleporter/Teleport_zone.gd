extends Node

@onready var root = $"../.."



func _teleport():
	
	_global_datas.selected_subscene = root.teleport_zone
	_global_datas.in_mirror_zone.emit(true)
	_global_datas.teleportation_active = true
	_global_datas._load_subscene.emit(true)
	
	print("TELEPORT TO ")
