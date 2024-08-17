extends Node

@export var all_intrigue : Array[board_intrigue_data]

func _ready():
	_global_datas.select_intrigue.connect(select_this_intrigue)
	
	
	
func select_this_intrigue(intrigue : board_intrigue_data):
	pass
	#for i in all_intrigue:
		#i.intrigue_node.visible = false
		#
	#intrigue.intrigue_node.visible = true
