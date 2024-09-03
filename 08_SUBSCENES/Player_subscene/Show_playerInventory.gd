extends Node

@export var all_debris_on_player : Array[Node3D]
var current_amount : int = 0


func _ready():
	pass
	#_global_datas.add_collect_element.connect(update_amount)
	
func update_amount(off):
	
	var size = _global_datas.element_collected.size()
	update_visibility(size)
	
	
func update_visibility(amount: int):
	for i in range(all_debris_on_player.size()):
		if i < amount:
			all_debris_on_player[i].visible = true
		else:
			all_debris_on_player[i].visible = false
