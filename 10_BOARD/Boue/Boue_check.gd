extends Node3D

@export var test_boue_exist : BoueData
var all_boue_obj : Array

func _ready():
	_global_datas.boue_archives.append(test_boue_exist)
	_global_datas.open_inventory.connect(_check_exist_boue)
	all_boue_obj = get_children()

func _check_exist_boue(condition : bool):
	
	if !condition:
		return
		
	for e in all_boue_obj:
		if check_photo_exist(e.Boue_Data):
			e._active()		
	
	
func check_photo_exist(boue_Data):

	for boue in _global_datas.boue_archives:
		if boue == boue_Data:
			return true 	
