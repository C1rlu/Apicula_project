extends Node

@export var info_text : Label
@onready var element_infos = $".."

var current_info : info_data
var ls_index : int = 0
func _ready():

	_global_datas.show_dive_zone_info.connect(show_info)
	_global_datas._go_Subscene.connect(close)
	show_info(false,null)

func close():
	show_info(false,null)		
func show_info(condition : bool, information : BoueData):
	
	if condition:
		change_text(information.info)
		current_info = information.info
	else:
		current_info = null
		
	element_infos.visible = condition
	
func update_ls(ls):
	if current_info:
		ls_index = ls
		change_text(current_info)	
	
					
func change_text(information : info_data):

	if information :
		var info_reader = board_info_reader.new()
		var text_info = info_reader.node_by_name(information,ls_index)
		info_text.text = text_info		
