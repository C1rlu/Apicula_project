extends Node

@export var zone_title_text : Label
@export var zone_text : Label
const ZONE_INFO_DIALOGUE = "res://15_GAME_RESSOURCE/00_Zone_data/Zone_info_dialogue.json"


var current_ls : int


func _ready():
	_global_datas._active_sonar.connect(_update)
	_global_datas._change_language_state.connect(_set_ls)


func _set_ls(ls_state : int):
	
	current_ls = ls_state
	_take_info(_global_datas.subscene_zone_index.to_lower())
		
	
func _update(_null):
	
	if zone_title_text.text != _global_datas.subscene_zone_index:		 
		zone_title_text.text = _global_datas.subscene_zone_index
		_take_info(_global_datas.subscene_zone_index.to_lower())

func _take_info(zone_index : String):

	var _path = str(ZONE_INFO_DIALOGUE)	
	var _reader = dialogue_info_reader.new()
	var result = _reader.node_by_name(_path,zone_index,current_ls)
	
	zone_text.text = result
	
