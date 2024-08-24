extends Node3D

@export var all_note : Array[Area3D]

#func _ready():
	#
	#_global_datas.open_inventory.connect(_check_found)
	#_check_found(true)
			#
#func _check_found(condition : bool):
	#
	#if !condition:
		#return
	#
	#for n in all_note :
		#if n.Note_data.is_onBoard:
			#n._active()
		#else:
			#n._disable()
	#

