extends Node
@onready var path_prefab = $"../../.."



func get_dive_data():
	
	return path_prefab.zone_datas
