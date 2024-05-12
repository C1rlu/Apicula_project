extends Node

@export var photo_data : PhotoData
@onready var root = $"../.."


func _ready():
	pass
	
func _select_tube():
	print("Select_Tube")
	#var target = root.position
	#_global_datas.focus_this_on_board.emit(target)
	var legend_text = photo_data.legend
	_global_datas._show_object_legend.emit(true,legend_text)
	_global_datas.selected_photoData = photo_data
	_global_datas.show_on_scanner.emit(true)
