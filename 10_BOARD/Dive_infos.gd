extends Node


func _ready():

	_global_datas.show_dive_zone_info.connect(show_info)
	_global_datas._go_Subscene.connect(close)
	show_info(false,null)

func close():
	show_info(false,null)		
func show_info(condition : bool, information : BoueData):
	
	if condition:
		_global_datas._show_object_legend.emit(true,information.info.info_node_name)
	else:
		_global_datas._show_object_legend.emit(false,"null")

